import 'package:flutter/material.dart';
import 'package:nowingoogle/domain/entities/event.dart';
import 'package:nowingoogle/domain/entities/questionnaire.dart';

Future<dynamic> showRSVPBottomSheet(BuildContext context, Event event) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum magna euismod volutpat semper."),
                  const SizedBox(
                    height: 24,
                  ),
                  event.questionnaire != null
                      ? ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, questionIndex) {
                            final question =
                                event.questionnaire!.questions[questionIndex];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  question.question,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                question.type == QuestionType.checkbox ||
                                        question.type == QuestionType.mcq
                                    ? ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, optionIndex) {
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  value: true,
                                                  onChanged: (_) {}),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                question.options[optionIndex],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ],
                                          );
                                        },
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: question.options.length,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: question.hint,
                                            filled: true,
                                          ),
                                          maxLines: null,
                                        ),
                                      ),
                              ],
                            );
                          },
                          separatorBuilder: (context, _) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: event.questionnaire!.questions.length,
                          shrinkWrap: true,
                          primary: false,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
