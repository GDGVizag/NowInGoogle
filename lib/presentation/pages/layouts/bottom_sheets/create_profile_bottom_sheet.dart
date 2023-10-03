import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_bloc.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_event.dart';
import 'package:nowingoogle/presentation/bloc/create_profile_module/create_profile_state.dart';
import 'package:nowingoogle/presentation/injector.dart';

class CreateProfileBottomSheet extends StatelessWidget {
  const CreateProfileBottomSheet(this._formKey, {super.key});
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProfileBloc, CreateProfileState>(
        listener: (context, state) {
      if (state is CreateProfileError && state.error.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  )
                ],
              );
            });
      }
      if (state is CreateProfileSuccess) {
        //Handle on success
      }
    }, builder: (context, state) {
      if (state is CreateProfileLoading) {
        return const CreateProfileLoadingState();
      }

      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            CreateProfileForm(
              formKey: _formKey,
              state: state,
            ),
          ],
        ),
      );
    });
  }
}

class CreateProfileForm extends StatefulWidget {
  const CreateProfileForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.state,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final CreateProfileState state;

  @override
  State<CreateProfileForm> createState() => _CreateProfileFormState();
}

class _CreateProfileFormState extends State<CreateProfileForm> {
  var career = "";
  var organization = "";
  var pincodeController = TextEditingController();
  var usernameController = TextEditingController();
  var gender = "";
  final FocusNode focusNode = FocusNode();
  var usernameHasFocus = false;
  var lastUsernameValidated = "";
  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      if (usernameHasFocus != focusNode.hasFocus) {
        usernameHasFocus = focusNode.hasFocus;
        if (!focusNode.hasFocus &&
            usernameController.text.isNotEmpty &&
            lastUsernameValidated != usernameController.text) {
          Injector.createProfileBloc.add(
            OnValidateUsername(username: usernameController.text),
          );
          lastUsernameValidated = usernameController.text;
        }
      }
    });
    return Form(
      key: widget._formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Help us know you better so that we can provide you with tailored experiences and opportunities. You can always update them from your profile.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : "Please enter a valid input";
              },
              onChanged: (_) {
                Injector.createProfileBloc
                    .add(OnUsernameValidationStatusReset());
              },
              controller: usernameController,
              focusNode: focusNode,
              decoration: InputDecoration(
                suffixIcon: (widget.state is CreateProfileFormState)
                    ? (widget.state as CreateProfileFormState)
                                .isUsernameValidated ==
                            UsernameStatus.unique
                        ? const Icon(Icons.check)
                        : (widget.state as CreateProfileFormState)
                                    .isUsernameValidated ==
                                UsernameStatus.notUnique
                            ? const Icon(Icons.error)
                            : null
                    : null,
                filled: true,
                label: const Text("Username"),
                errorText: (widget.state is CreateProfileError)
                    ? (widget.state as CreateProfileError).usernameError
                    : (widget.state is CreateProfileFormState)
                        ? ((widget.state as CreateProfileFormState)
                                    .isUsernameValidated ==
                                UsernameStatus.notUnique
                            ? "Username already exists!"
                            : null)
                        : null,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Gender"),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: SegmentedButton(
                    segments: const [
                      ButtonSegment(
                        value: "male",
                        label: Text("Male"),
                      ),
                      ButtonSegment(
                        value: "female",
                        label: Text("Female"),
                      ),
                      ButtonSegment(
                        value: "other",
                        label: Text("Other"),
                      ),
                    ],
                    selected: {
                      gender,
                    },
                    onSelectionChanged: (selectedValues) {
                      setState(() {
                        gender = selectedValues.first;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Autocomplete(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return [
                  "Student",
                  "Intern",
                  "Professional",
                ].where((element) => element
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: textEditingController,
                  focusNode: focusNode,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                  onChanged: (_) {
                    career = _;
                  },
                  validator: (String? value) {
                    return (value?.isNotEmpty ?? false)
                        ? null
                        : "Please enter a valid input";
                  },
                  decoration: const InputDecoration(
                    labelText: 'Career',
                    filled: true,
                  ),
                );
              },
              onSelected: (selectedValue) {
                career = selectedValue;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Autocomplete(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return [
                  "Gandhi Institute of Technology And Management (GITAM)",
                  "Gayatri Vidya Parishad (GVP)",
                  "Gayatri Vidya Parishad College for Engineering Women(GVPCEW)",
                  "Ekfrazo Technologies",
                  "Andhra University (AU)"
                ].where((element) => element
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: textEditingController,
                  focusNode: focusNode,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                  onChanged: (_) {
                    organization = _;
                  },
                  validator: (String? value) {
                    return (value?.isNotEmpty ?? false)
                        ? null
                        : "Please enter a valid input";
                  },
                  decoration: const InputDecoration(
                    labelText: 'Organization',
                    filled: true,
                  ),
                );
              },
              onSelected: (selectedValue) {
                organization = selectedValue;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : "Please enter a valid input";
              },
              controller: pincodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 6,
              decoration: InputDecoration(
                filled: true,
                label: const Text("Pincode"),
                errorText: (widget.state is CreateProfileError)
                    ? (widget.state as CreateProfileError).pincodeError
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: (widget.state is CreateProfileError &&
                                (widget.state as CreateProfileError)
                                    .usernameError
                                    .isNotEmpty) ||
                            usernameController.text.isEmpty
                        ? null
                        : () {
                            if (widget._formKey.currentState?.validate() ??
                                false) {
                              Injector.createProfileBloc.add(
                                OnCreateProfile(
                                  username: usernameController.text,
                                  gender: gender,
                                  career: career,
                                  organization: organization,
                                  pincode: pincodeController.text,
                                ),
                              );
                            } else {
                              //TODO show snackbar with error
                            }
                          },
                    child: const Text("Save"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CreateProfileLoadingState extends StatelessWidget {
  const CreateProfileLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hang on!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "We're almost there.\nJust give us a moment to create your profile!",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 36.0),
            child: CircularProgressIndicator(),
          )),
        ],
      ),
    );
  }
}
