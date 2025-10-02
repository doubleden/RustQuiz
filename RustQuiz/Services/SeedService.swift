//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var getTheBookSource: @Sendable () async throws -> Source
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getTheBookSource: {
            Source(
                id: UUID(),
                title: "the_book",
                priority: 1,
                quizzes: [
                    Quiz(
                        id: UUID(),
                        theme: "common_programming_concepts",
                        priority: 1,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "how_are_variables_declared_by_default_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "mutable", isCorrect: false),
                                    Answer(id: UUID(),title: "immutable", isCorrect: true),
                                    Answer(id: UUID(),title: "dynamic", isCorrect: false),
                                    Answer(id: UUID(),title: "by_reference", isCorrect: false)
                                ],
                                descriptionText: "let_creates_an_immutable_binding_mutability_is_only_via_mut",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "to_make_a_variable_mutable_you_need",
                                answers: [
                                    Answer(id: UUID(),title: "var", isCorrect: false),
                                    Answer(id: UUID(),title: "mut", isCorrect: true),
                                    Answer(id: UUID(),title: "const", isCorrect: false),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "let_mut_x_this_is_the_only_syntax_to_allow_mutation.",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_let_x_5_x_10",
                                answers: [
                                    Answer(id: UUID(),title: "compilation_error_missing_semicolon", isCorrect: false),
                                    Answer(id: UUID(),title: "will_print_10", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error_assignment_to_immutable", isCorrect: true),
                                    Answer(id: UUID(),title: "automatically_becomes_mut", isCorrect: false)
                                ],
                                descriptionText: "rust_requires_explicit_mut_also_semicolon_after_5_needed",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_const_differ_from_let",
                                answers: [
                                    Answer(id: UUID(),title: "const_requires_explicit_type", isCorrect: true),
                                    Answer(id: UUID(),title: "const_only_inside_functions", isCorrect: false),
                                    Answer(id: UUID(),title: "const_can_be_made_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "let_evaluated_only_at_compile_time", isCorrect: false)
                                ],
                                descriptionText: "constants_always_have_explicit_type_and_constexpr_value",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_constant_declaration",
                                answers: [
                                    Answer(id: UUID(),title: "const_pi_3_14", isCorrect: false),
                                    Answer(id: UUID(),title: "const_pi_f64_3_14", isCorrect: true),
                                    Answer(id: UUID(),title: "let_const_pi_f64_3_14", isCorrect: false),
                                    Answer(id: UUID(),title: "constant_pi_3_14", isCorrect: false)
                                ],
                                descriptionText: "type_after_colon_is_required_that_is_language_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_shadowing",
                                answers: [
                                    Answer(id: UUID(),title: "assignment_without_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "re_declaring_with_let_same_name", isCorrect: true),
                                    Answer(id: UUID(),title: "value_erasure", isCorrect: false),
                                    Answer(id: UUID(),title: "automatic_type_casting", isCorrect: false)
                                ],
                                descriptionText: "let_x_let_x_creates_a_new_binding",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_can_you_do_with_shadowing_but_not_mut",
                                answers: [
                                    Answer(id: UUID(),title: "change_type_with_same_name", isCorrect: true),
                                    Answer(id: UUID(),title: "change_value", isCorrect: false),
                                    Answer(id: UUID(),title: "use_in_loop", isCorrect: false),
                                    Answer(id: UUID(),title: "pass_to_function", isCorrect: false)
                                ],
                                descriptionText: "new_let_can_have_different_type_it_is_actually_new_variable",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_shadowing_example",
                                answers: [
                                    Answer(id: UUID(),title: "5", isCorrect: false),
                                    Answer(id: UUID(),title: "7", isCorrect: false),
                                    Answer(id: UUID(),title: "15", isCorrect: false),
                                    Answer(id: UUID(),title: "21", isCorrect: true)
                                ],
                                descriptionText: "7_to_21_each_line_creates_a_new_x",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_let_mut_s_hi_s_s_len",
                                answers: [
                                    Answer(id: UUID(),title: "type_error", isCorrect: true),
                                    Answer(id: UUID(),title: "becomes_2", isCorrect: false),
                                    Answer(id: UUID(),title: "becomes_2_string", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "static_str_to_usize_without_shadowing_is_invalid_mut_does_not_change_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_integer_type",
                                answers: [
                                    Answer(id: UUID(),title: "i32", isCorrect: true),
                                    Answer(id: UUID(),title: "i64", isCorrect: false),
                                    Answer(id: UUID(),title: "usize", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "default_is_i32",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "range_of_u8",
                                answers: [
                                    Answer(id: UUID(),title: "128_to_127", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_255", isCorrect: true),
                                    Answer(id: UUID(),title: "255_to_255", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "8_bits_unsigned",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_about_let_x_u8_256_debug",
                                answers: [
                                    Answer(id: UUID(),title: "becomes_0", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "truncated_to_255", isCorrect: false)
                                ],
                                descriptionText: "constant_out_of_range_256_is_outside_u8_range",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "type_of_57u8",
                                answers: [
                                    Answer(id: UUID(),title: "i32", isCorrect: false),
                                    Answer(id: UUID(),title: "u32", isCorrect: false),
                                    Answer(id: UUID(),title: "u8", isCorrect: true),
                                    Answer(id: UUID(),title: "usize", isCorrect: false)
                                ],
                                descriptionText: "literal_suffix_sets_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_0b1111_0000_mean",
                                answers: [
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "binary_literal", isCorrect: true),
                                    Answer(id: UUID(),title: "string", isCorrect: false),
                                    Answer(id: UUID(),title: "char", isCorrect: false)
                                ],
                                descriptionText: "underscores_allowed_for_readability",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_float_type",
                                answers: [
                                    Answer(id: UUID(),title: "f32", isCorrect: false),
                                    Answer(id: UUID(),title: "f64", isCorrect: true),
                                    Answer(id: UUID(),title: "decimal", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "more_precision_at_similar_cost",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "result_integers_5_divided_by_3",
                                answers: [
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "1", isCorrect: true),
                                    Answer(id: UUID(),title: "0", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "division_rounds_toward_zero",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "boolean_literal",
                                answers: [
                                    Answer(id: UUID(),title: "true_string", isCorrect: false),
                                    Answer(id: UUID(),title: "True", isCorrect: false),
                                    Answer(id: UUID(),title: "false", isCorrect: true),
                                    Answer(id: UUID(),title: "1", isCorrect: false)
                                ],
                                descriptionText: "lowercase_not_a_string",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "char_in_rust",
                                answers: [
                                    Answer(id: UUID(),title: "1_byte_ascii", isCorrect: false),
                                    Answer(id: UUID(),title: "2_bytes_utf16", isCorrect: false),
                                    Answer(id: UUID(),title: "4_bytes_unicode_scalar", isCorrect: true),
                                    Answer(id: UUID(),title: "variable_length", isCorrect: false)
                                ],
                                descriptionText: "one_unicode_scalar",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_tuples",
                                answers: [
                                    Answer(id: UUID(),title: "fixed_length", isCorrect: false),
                                    Answer(id: UUID(),title: "different_types_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "indexed_by_dot_0", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "all_true",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_tuple_index",
                                answers: [
                                    Answer(id: UUID(),title: "1", isCorrect: false),
                                    Answer(id: UUID(),title: "2_0", isCorrect: true),
                                    Answer(id: UUID(),title: "c", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "index_1_to_second_element",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_i32_5_array",
                                answers: [
                                    Answer(id: UUID(),title: "only_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "fixed_length", isCorrect: false),
                                    Answer(id: UUID(),title: "length_is_part_of_type", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "t_n",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_let_a_3_4_create",
                                answers: [
                                    Answer(id: UUID(),title: "3", isCorrect: false),
                                    Answer(id: UUID(),title: "3_3_3_3", isCorrect: true),
                                    Answer(id: UUID(),title: "4_4_4", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "repetition_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "accessing_a_10_when_length_is_5",
                                answers: [
                                    Answer(id: UUID(),title: "ub", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: true),
                                    Answer(id: UUID(),title: "none", isCorrect: false)
                                ],
                                descriptionText: "bounds_checked_at_runtime",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_declaration",
                                answers: [
                                    Answer(id: UUID(),title: "func_name", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_name", isCorrect: true),
                                    Answer(id: UUID(),title: "function_name", isCorrect: false),
                                    Answer(id: UUID(),title: "def_name", isCorrect: false)
                                ],
                                descriptionText: "keyword_fn",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_parameters",
                                answers: [
                                    Answer(id: UUID(),title: "name_only", isCorrect: false),
                                    Answer(id: UUID(),title: "type_only", isCorrect: false),
                                    Answer(id: UUID(),title: "name_and_type", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "type_annotations_are_mandatory",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_return",
                                answers: [
                                    Answer(id: UUID(),title: "always_return", isCorrect: false),
                                    Answer(id: UUID(),title: "last_expression_without_semicolon", isCorrect: true),
                                    Answer(id: UUID(),title: "last_expression_with_semicolon", isCorrect: false),
                                    Answer(id: UUID(),title: "always_unit", isCorrect: false)
                                ],
                                descriptionText: "tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "if_you_put_semicolon_after_x_plus_1_in_function",
                                answers: [
                                    Answer(id: UUID(),title: "returns_x_plus_1", isCorrect: false),
                                    Answer(id: UUID(),title: "type_error_unit", isCorrect: true),
                                    Answer(id: UUID(),title: "auto_return", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "semicolon_turns_it_into_statement",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "statement_vs_expression",
                                answers: [
                                    Answer(id: UUID(),title: "statement_returns_value", isCorrect: false),
                                    Answer(id: UUID(),title: "expression_computes_value", isCorrect: true),
                                    Answer(id: UUID(),title: "both_return", isCorrect: false),
                                    Answer(id: UUID(),title: "no_difference", isCorrect: false)
                                ],
                                descriptionText: "rust_is_expression_oriented",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_let_x_let_y_6",
                                answers: [
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(),title: "x_and_y_are_6", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "ub", isCorrect: false)
                                ],
                                descriptionText: "let_y_6_is_not_an_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "type_of_if_condition",
                                answers: [
                                    Answer(id: UUID(),title: "any_nonzero", isCorrect: false),
                                    Answer(id: UUID(),title: "only_bool", isCorrect: true),
                                    Answer(id: UUID(),title: "int_or_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "any_scalar", isCorrect: false)
                                ],
                                descriptionText: "no_implicit_conversions",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_if_else_as_expression",
                                answers: [
                                    Answer(id: UUID(),title: "different_types_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "branch_types_must_match", isCorrect: false),
                                    Answer(id: UUID(),title: "else_is_optional", isCorrect: false),
                                    Answer(id: UUID(),title: "b_and_c", isCorrect: true)
                                ],
                                descriptionText: "if_is_expression_else_is_optional",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_if_expression",
                                answers: [
                                    Answer(id: UUID(),title: "1", isCorrect: true),
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "true", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "took_the_value_of_true_branch",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "infinite_loop_until_break",
                                answers: [
                                    Answer(id: UUID(),title: "loop", isCorrect: true),
                                    Answer(id: UUID(),title: "while", isCorrect: false),
                                    Answer(id: UUID(),title: "for", isCorrect: false),
                                    Answer(id: UUID(),title: "repeat", isCorrect: false)
                                ],
                                descriptionText: "loop_has_no_condition",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "break_value_in_loop",
                                answers: [
                                    Answer(id: UUID(),title: "skip_iteration", isCorrect: false),
                                    Answer(id: UUID(),title: "exit_loop_and_return_value", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "return_unit", isCorrect: false)
                                ],
                                descriptionText: "loop_is_an_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "loop_labels_label",
                                answers: [
                                    Answer(id: UUID(),title: "comments", isCorrect: false),
                                    Answer(id: UUID(),title: "target_for_break_continue", isCorrect: true),
                                    Answer(id: UUID(),title: "optimization", isCorrect: false),
                                    Answer(id: UUID(),title: "counter", isCorrect: false)
                                ],
                                descriptionText: "eg_break_outer",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_while",
                                answers: [
                                    Answer(id: UUID(),title: "while_condition_is_true", isCorrect: false),
                                    Answer(id: UUID(),title: "can_be_infinite", isCorrect: false),
                                    Answer(id: UUID(),title: "condition_is_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "depends_on_condition",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_for",
                                answers: [
                                    Answer(id: UUID(),title: "iterates_into_iterator", isCorrect: false),
                                    Answer(id: UUID(),title: "works_with_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "safer_than_manual_indexing", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "idiomatic_iteration",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "countdown_3_to_1",
                                answers: [
                                    Answer(id: UUID(),title: "for_n_in_1_to_3_rev", isCorrect: true),
                                    Answer(id: UUID(),title: "for_n_in_3_to_1_rev", isCorrect: false),
                                    Answer(id: UUID(),title: "for_n_in_1_to_3", isCorrect: false),
                                    Answer(id: UUID(),title: "for_n_in_0_to_3_rev", isCorrect: false)
                                ],
                                descriptionText: "1_to_3_gives_1_to_3_rev_gives_3_to_1",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "comments",
                                answers: [
                                    Answer(id: UUID(),title: "hash", isCorrect: false),
                                    Answer(id: UUID(),title: "double_slash", isCorrect: false),
                                    Answer(id: UUID(),title: "slash_star_star_slash", isCorrect: false),
                                    Answer(id: UUID(),title: "b_and_c", isCorrect: true)
                                ],
                                descriptionText: "rust_supports_both",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_comment",
                                answers: [
                                    Answer(id: UUID(),title: "this_is_comment", isCorrect: true),
                                    Answer(id: UUID(),title: "dash_this_is_comment", isCorrect: false),
                                    Answer(id: UUID(),title: "percent_percent_this_is_comment", isCorrect: false),
                                    Answer(id: UUID(),title: "hash_this_is_comment", isCorrect: false)
                                ],
                                descriptionText: "hash_is_not_for_comments_used_for_attributes",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_usize",
                                answers: [
                                    Answer(id: UUID(),title: "size_depends_on_architecture", isCorrect: false),
                                    Answer(id: UUID(),title: "used_for_indices_sizes", isCorrect: false),
                                    Answer(id: UUID(),title: "unsigned", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "platform_dependent_index_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "tuple_of_three_elements",
                                answers: [
                                    Answer(id: UUID(),title: "1_a_true", isCorrect: true),
                                    Answer(id: UUID(),title: "1_a_true_braces", isCorrect: false),
                                    Answer(id: UUID(),title: "1_a_true_brackets", isCorrect: false),
                                    Answer(id: UUID(),title: "1_a_true_angle", isCorrect: false)
                                ],
                                descriptionText: "parentheses_to_tuple",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_b_A_mean",
                                answers: [
                                    Answer(id: UUID(),title: "char_A", isCorrect: false),
                                    Answer(id: UUID(),title: "u8_with_ascii_value", isCorrect: true),
                                    Answer(id: UUID(),title: "A_string", isCorrect: false),
                                    Answer(id: UUID(),title: "bool", isCorrect: false)
                                ],
                                descriptionText: "prefix_b_to_byte_literal",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "range_of_i16",
                                answers: [
                                    Answer(id: UUID(),title: "32768_to_32767", isCorrect: true),
                                    Answer(id: UUID(),title: "65536_to_65535", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_32767", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_65535", isCorrect: false)
                                ],
                                descriptionText: "16_bit_signed",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "unit_type",
                                answers: [
                                    Answer(id: UUID(),title: "empty_value", isCorrect: false),
                                    Answer(id: UUID(),title: "empty_tuple", isCorrect: false),
                                    Answer(id: UUID(),title: "functions_without_return_type_return_it", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "all_properties_of_unit",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_function_with_parameter",
                                answers: [
                                    Answer(id: UUID(),title: "fn_f_x", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_x_i32", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_f_i32_x", isCorrect: false),
                                    Answer(id: UUID(),title: "function_f_x_i32", isCorrect: false)
                                ],
                                descriptionText: "type_required_after_colon",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_block_expression",
                                answers: [
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "3", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "block_is_an_expression_returns_y_plus_3",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_if_false_10_else_ten",
                                answers: [
                                    Answer(id: UUID(),title: "becomes_string", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error_different_branch_types", isCorrect: true),
                                    Answer(id: UUID(),title: "becomes_option", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "if_expression_must_have_single_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_exit_infinite_loop_properly",
                                answers: [
                                    Answer(id: UUID(),title: "break", isCorrect: false),
                                    Answer(id: UUID(),title: "return", isCorrect: false),
                                    Answer(id: UUID(),title: "exit", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above_possible", isCorrect: true)
                                ],
                                descriptionText: "all_terminate_loop_function_process_but_idiomatic_is_break",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_keywords",
                                answers: [
                                    Answer(id: UUID(),title: "can_be_used_as_names", isCorrect: false),
                                    Answer(id: UUID(),title: "reserved", isCorrect: true),
                                    Answer(id: UUID(),title: "ignored", isCorrect: false),
                                    Answer(id: UUID(),title: "usable_with_at", isCorrect: false)
                                ],
                                descriptionText: "see_appendix_a",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_about_let_guess_u32_42_parse_unwrap",
                                answers: [
                                    Answer(id: UUID(),title: "string", isCorrect: false),
                                    Answer(id: UUID(),title: "u32_equals_42", isCorrect: true),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "bool", isCorrect: false)
                                ],
                                descriptionText: "type_annotation_directs_parse",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_len_do_on_i32_5",
                                answers: [
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "last_element", isCorrect: false),
                                    Answer(id: UUID(),title: "option", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "array_length",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "overflow_of_u8_in_release",
                                answers: [
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "wrapping", isCorrect: true),
                                    Answer(id: UUID(),title: "auto_type_promotion", isCorrect: false)
                                ],
                                descriptionText: "two_complement_wrapping",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "modulo_operator",
                                answers: [
                                    Answer(id: UUID(),title: "mod", isCorrect: false),
                                    Answer(id: UUID(),title: "percent", isCorrect: true),
                                    Answer(id: UUID(),title: "rem", isCorrect: false),
                                    Answer(id: UUID(),title: "div", isCorrect: false)
                                ],
                                descriptionText: "standard_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_with_return_value",
                                answers: [
                                    Answer(id: UUID(),title: "fn_f_return_5", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_i32_5", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_f_i32_5_arrow", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_equals_5", isCorrect: false)
                                ],
                                descriptionText: "arrow_type_plus_tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_for_in_rust",
                                answers: [
                                    Answer(id: UUID(),title: "can_iterate_chars_of_string", isCorrect: false),
                                    Answer(id: UUID(),title: "can_iterate_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "safer_than_manual_indexing", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "works_with_any_into_iterator",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "hex_literal",
                                answers: [
                                    Answer(id: UUID(),title: "0xFF", isCorrect: true),
                                    Answer(id: UUID(),title: "FF", isCorrect: false),
                                    Answer(id: UUID(),title: "xFF", isCorrect: false),
                                    Answer(id: UUID(),title: "xFF", isCorrect: false)
                                ],
                                descriptionText: "0x_is_valid_prefix",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_months_array",
                                answers: [
                                    Answer(id: UUID(),title: "Jan", isCorrect: false),
                                    Answer(id: UUID(),title: "Feb", isCorrect: false),
                                    Answer(id: UUID(),title: "Mar", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "index_2",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_continue",
                                answers: [
                                    Answer(id: UUID(),title: "breaks_whole_loop", isCorrect: false),
                                    Answer(id: UUID(),title: "skips_current_iteration", isCorrect: true),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "only_in_while", isCorrect: false)
                                ],
                                descriptionText: "moves_to_next_iteration",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_rev",
                                answers: [
                                    Answer(id: UUID(),title: "applies_to_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "reverses_iteration_order", isCorrect: false),
                                    Answer(id: UUID(),title: "works_with_for", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "it_is_an_iterator_adapter",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "explicit_type_for_variable",
                                answers: [
                                    Answer(id: UUID(),title: "let_x_5", isCorrect: false),
                                    Answer(id: UUID(),title: "let_x_i32_5", isCorrect: true),
                                    Answer(id: UUID(),title: "var_x_i32_5", isCorrect: false),
                                    Answer(id: UUID(),title: "def_x_i32_5", isCorrect: false)
                                ],
                                descriptionText: "let_name_type_equals_expr",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_naming_style",
                                answers: [
                                    Answer(id: UUID(),title: "camelCase", isCorrect: false),
                                    Answer(id: UUID(),title: "snake_case", isCorrect: true),
                                    Answer(id: UUID(),title: "PascalCase", isCorrect: false),
                                    Answer(id: UUID(),title: "kebab_case", isCorrect: false)
                                ],
                                descriptionText: "idiomatic_rust_style",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_plus_function",
                                answers: [
                                    Answer(id: UUID(),title: "4", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "unit", isCorrect: false)
                                ],
                                descriptionText: "returns_5_as_tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_comments",
                                answers: [
                                    Answer(id: UUID(),title: "single_line", isCorrect: false),
                                    Answer(id: UUID(),title: "multi_line_including_nested", isCorrect: false),
                                    Answer(id: UUID(),title: "ignored_by_compiler", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "both_syntaxes_valid_block_comments_nest",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "result_of_43_modulo_5",
                                answers: [
                                    Answer(id: UUID(),title: "3", isCorrect: true),
                                    Answer(id: UUID(),title: "4", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: false),
                                    Answer(id: UUID(),title: "8", isCorrect: false)
                                ],
                                descriptionText: "43_equals_5_times_8_plus_3",
                                descriptionLink: "common_programming_concepts_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "understanding_ownership",
                        priority: 2,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "what_is_ownership_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "background_GC", isCorrect: false),
                                    Answer(id: UUID(),title: "a_set_of_compiler_checked_rules_for_memory_management", isCorrect: true),
                                    Answer(id: UUID(),title: "manual_freeing_via_free", isCorrect: false),
                                    Answer(id: UUID(),title: "a_compile_time_optimization", isCorrect: false)
                                ],
                                descriptionText: "ownership_is_rules_the_compiler_checks_it_provides_safety_without_a_GC",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_rule_about_values_owner_is_true",
                                answers: [
                                    Answer(id: UUID(),title: "a_value_can_have_many_owners", isCorrect: false),
                                    Answer(id: UUID(),title: "a_value_may_have_no_owner", isCorrect: false),
                                    Answer(id: UUID(),title: "at_any_moment_there_is_exactly_one_owner", isCorrect: true),
                                    Answer(id: UUID(),title: "owners_exist_only_for_heap_data", isCorrect: false)
                                ],
                                descriptionText: "one_owner_at_a_time_prevents_double_drop",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_when_owner_goes_out_of_scope",
                                answers: [
                                    Answer(id: UUID(),title: "nothing", isCorrect: false),
                                    Answer(id: UUID(),title: "memory_leaks", isCorrect: false),
                                    Answer(id: UUID(),title: "drop_is_called_and_resource_is_released", isCorrect: true),
                                    Answer(id: UUID(),title: "the_value_becomes_static", isCorrect: false)
                                ],
                                descriptionText: "automatic_drop_rust_uses_raii",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "where_do_fixed_size_types_live_entirely",
                                answers: [
                                    Answer(id: UUID(),title: "on_the_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "on_the_stack", isCorrect: true),
                                    Answer(id: UUID(),title: "always_in_static_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "in_the_binary_file", isCorrect: false)
                                ],
                                descriptionText: "scalars_are_on_stack_size_known_at_compile_time",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_str_differ_from_string",
                                answers: [
                                    Answer(id: UUID(),title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(),title: "str_is_immutable_slice_string_owns_and_mutably_manages_heap_data", isCorrect: true),
                                    Answer(id: UUID(),title: "str_is_always_on_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "string_is_always_on_stack", isCorrect: false)
                                ],
                                descriptionText: "str_is_slice_string_is_owning_buffer_different_memory_models",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_string_move_example",
                                answers: [
                                    Answer(id: UUID(),title: "prints_hi", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_use_of_moved_value", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "s1_is_automatically_cloned", isCorrect: false)
                                ],
                                descriptionText: "s1_was_moved_string_is_not_copy",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_name_of_ownership_transfer_in_let_s2_s1",
                                answers: [
                                    Answer(id: UUID(),title: "borrowing", isCorrect: false),
                                    Answer(id: UUID(),title: "moving", isCorrect: true),
                                    Answer(id: UUID(),title: "cloning", isCorrect: false),
                                    Answer(id: UUID(),title: "aliasing", isCorrect: false)
                                ],
                                descriptionText: "that_is_move_ownership_is_transferred_to_new_name",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_copied_in_let_s2_s1_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "heap_data", isCorrect: false),
                                    Answer(id: UUID(),title: "only_the_length", isCorrect: false),
                                    Answer(id: UUID(),title: "pointer_length_and_capacity_stack_part", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "stack_metadata_no_deep_copy_is_performed",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_does_rust_invalidate_old_variable_after_move",
                                answers: [
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(),title: "to_avoid_double_free", isCorrect: true),
                                    Answer(id: UUID(),title: "to_make_debugging_easier", isCorrect: false),
                                    Answer(id: UUID(),title: "to_speed_up_memory_access", isCorrect: false)
                                ],
                                descriptionText: "no_two_owners_of_one_buffer_memory_safety",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_clone_do_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "copies_only_the_pointer", isCorrect: false),
                                    Answer(id: UUID(),title: "moves_ownership", isCorrect: false),
                                    Answer(id: UUID(),title: "performs_deep_copy_of_heap_data", isCorrect: true),
                                    Answer(id: UUID(),title: "frees_the_original", isCorrect: false)
                                ],
                                descriptionText: "deep_copy_duplicates_the_bytes",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_types_typically_implement_copy",
                                answers: [
                                    Answer(id: UUID(),title: "all_heap_types", isCorrect: false),
                                    Answer(id: UUID(),title: "scalars_and_tuples_composed_entirely_of_copy_types", isCorrect: true),
                                    Answer(id: UUID(),title: "only_string", isCorrect: false),
                                    Answer(id: UUID(),title: "any_structs", isCorrect: false)
                                ],
                                descriptionText: "simple_stack_types_copying_is_trivial",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_isnt_string_copy",
                                answers: [
                                    Answer(id: UUID(),title: "it_is_str", isCorrect: false),
                                    Answer(id: UUID(),title: "it_manages_heap_resource_drop", isCorrect: true),
                                    Answer(id: UUID(),title: "it_is_too_long", isCorrect: false),
                                    Answer(id: UUID(),title: "it_requires_static", isCorrect: false)
                                ],
                                descriptionText: "has_resource_and_drop_copying_would_be_unsafe",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "passing_arguments_to_function_by_value",
                                answers: [
                                    Answer(id: UUID(),title: "is_always_deep_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "behaves_like_assignment_move_or_copy", isCorrect: true),
                                    Answer(id: UUID(),title: "is_always_by_reference", isCorrect: false),
                                    Answer(id: UUID(),title: "never_moves", isCorrect: false)
                                ],
                                descriptionText: "same_rules_unified_ownership_model",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_is_true_function_takes_string",
                                answers: [
                                    Answer(id: UUID(),title: "x_is_available", isCorrect: false),
                                    Answer(id: UUID(),title: "x_is_unavailable_moved", isCorrect: true),
                                    Answer(id: UUID(),title: "x_is_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "there_will_be_panic", isCorrect: false)
                                ],
                                descriptionText: "move_into_function_string_passed_by_ownership",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_return_value_without_return",
                                answers: [
                                    Answer(id: UUID(),title: "you_cant", isCorrect: false),
                                    Answer(id: UUID(),title: "make_it_last_expression_without_semicolon", isCorrect: true),
                                    Answer(id: UUID(),title: "use_yield", isCorrect: false),
                                    Answer(id: UUID(),title: "use_give_back", isCorrect: false)
                                ],
                                descriptionText: "tail_expression_expressions_return_values",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_use_references_t",
                                answers: [
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(),title: "to_temporarily_borrow_value_without_transferring_ownership", isCorrect: true),
                                    Answer(id: UUID(),title: "for_deep_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "to_make_it_static", isCorrect: false)
                                ],
                                descriptionText: "use_without_move_borrowing",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_true_about_string_reference",
                                answers: [
                                    Answer(id: UUID(),title: "allows_modifying_string", isCorrect: false),
                                    Answer(id: UUID(),title: "immutable_reference_read_without_owning", isCorrect: true),
                                    Answer(id: UUID(),title: "extends_owners_lifetime", isCorrect: false),
                                    Answer(id: UUID(),title: "calls_drop_on_owner", isCorrect: false)
                                ],
                                descriptionText: "read_only_need_mut_for_mutation",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_allow_modifying_borrowed_string",
                                answers: [
                                    Answer(id: UUID(),title: "accept_mut_string_and_pass_mut_s", isCorrect: true),
                                    Answer(id: UUID(),title: "accept_string", isCorrect: false),
                                    Answer(id: UUID(),title: "accept_string", isCorrect: false),
                                    Answer(id: UUID(),title: "accept_box_string", isCorrect: false)
                                ],
                                descriptionText: "need_mutable_reference_explicit_write_permission",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "constraint_on_references",
                                answers: [
                                    Answer(id: UUID(),title: "many_mut_at_same_time_are_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "either_one_mut_or_any_number_of_but_not_both_simultaneously", isCorrect: true),
                                    Answer(id: UUID(),title: "one_mut_and_one_are_allowed_together", isCorrect: false),
                                    Answer(id: UUID(),title: "no_constraints", isCorrect: false)
                                ],
                                descriptionText: "anti_data_race_rule_prevents_races",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_with_simultaneous_and_mut_to_same_object",
                                answers: [
                                    Answer(id: UUID(),title: "compiles", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_e0502", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "ub", isCorrect: false)
                                ],
                                descriptionText: "borrowing_conflict_violates_rules",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "when_does_reference_lifetime_end_in_simple_cases_nll",
                                answers: [
                                    Answer(id: UUID(),title: "always_at_end_of_block", isCorrect: false),
                                    Answer(id: UUID(),title: "when_owner_is_dropped", isCorrect: false),
                                    Answer(id: UUID(),title: "after_its_last_use", isCorrect: true),
                                    Answer(id: UUID(),title: "never", isCorrect: false)
                                ],
                                descriptionText: "non_lexical_lifetimes_shorten_it_safer_and_more_flexible",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_dangling_reference",
                                answers: [
                                    Answer(id: UUID(),title: "reference_to_another_type", isCorrect: false),
                                    Answer(id: UUID(),title: "reference_to_already_freed_memory", isCorrect: true),
                                    Answer(id: UUID(),title: "reference_always_on_stack", isCorrect: false),
                                    Answer(id: UUID(),title: "reference_to_empty_array", isCorrect: false)
                                ],
                                descriptionText: "dangling_reference_object_already_dropped",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_doesnt_dangle_function_compile",
                                answers: [
                                    Answer(id: UUID(),title: "you_cant_return_references", isCorrect: false),
                                    Answer(id: UUID(),title: "s_will_be_dropped_reference_becomes_invalid", isCorrect: true),
                                    Answer(id: UUID(),title: "you_cant_allocate_in_function", isCorrect: false),
                                    Answer(id: UUID(),title: "you_need_gc", isCorrect: false)
                                ],
                                descriptionText: "returning_reference_to_local_dangling_references_are_forbidden",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_fix_dangle",
                                answers: [
                                    Answer(id: UUID(),title: "return_string_by_ownership", isCorrect: true),
                                    Answer(id: UUID(),title: "always_return_static_string", isCorrect: false),
                                    Answer(id: UUID(),title: "return_string", isCorrect: false),
                                    Answer(id: UUID(),title: "use_unsafe", isCorrect: false)
                                ],
                                descriptionText: "move_value_out_owner_lives_outside",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_slice_str_t",
                                answers: [
                                    Answer(id: UUID(),title: "ownership_of_part_of_collection", isCorrect: false),
                                    Answer(id: UUID(),title: "non_owning_reference_to_contiguous_region_of_data", isCorrect: true),
                                    Answer(id: UUID(),title: "copied_range", isCorrect: false),
                                    Answer(id: UUID(),title: "smart_pointer_with_auto_drop", isCorrect: false)
                                ],
                                descriptionText: "slice_equals_pointer_plus_length_no_ownership",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_returning_usize_index_from_first_word_risky",
                                answers: [
                                    Answer(id: UUID(),title: "index_can_be_negative", isCorrect: false),
                                    Answer(id: UUID(),title: "index_isnt_tied_to_data_and_becomes_stale_after_modifications", isCorrect: true),
                                    Answer(id: UUID(),title: "usize_is_too_small", isCorrect: false),
                                    Answer(id: UUID(),title: "you_cant_compute_string_length", isCorrect: false)
                                ],
                                descriptionText: "detached_index_breaks_after_clear_no_coupling_to_data",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_signature_is_more_general_first_word",
                                answers: [
                                    Answer(id: UUID(),title: "fn_first_word_s_string_str", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_first_word_s_str_str", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_first_word_s_string_str", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_first_word_t_s_t_str", isCorrect: false)
                                ],
                                descriptionText: "works_with_string_and_literals_more_general_slice",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_slice_s_3_7_of_string_store",
                                answers: [
                                    Answer(id: UUID(),title: "copy_of_bytes", isCorrect: false),
                                    Answer(id: UUID(),title: "pointer_to_start_and_length", isCorrect: true),
                                    Answer(id: UUID(),title: "new_string", isCorrect: false),
                                    Answer(id: UUID(),title: "static_data", isCorrect: false)
                                ],
                                descriptionText: "pointer_plus_len_no_copying",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_slice_bounds_are_valid_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "any_byte_offsets", isCorrect: false),
                                    Answer(id: UUID(),title: "only_at_valid_utf8_boundaries", isCorrect: true),
                                    Answer(id: UUID(),title: "only_on_unicode_grapheme_boundaries", isCorrect: false),
                                    Answer(id: UUID(),title: "only_multiples_of_4", isCorrect: false)
                                ],
                                descriptionText: "by_unicode_scalar_boundaries_otherwise_runtime_error",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_string_clear_borrow_conflict",
                                answers: [
                                    Answer(id: UUID(),title: "prints_empty", isCorrect: false),
                                    Answer(id: UUID(),title: "compiles_and_crashes", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_borrow_conflict", isCorrect: true),
                                    Answer(id: UUID(),title: "its_fine_w_isnt_tied_to_s", isCorrect: false)
                                ],
                                descriptionText: "cannot_have_and_mut_simultaneously_clear_needs_mut_while_w_is_alive",
                                descriptionLink: "understanding_ownership_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "using_structs_to_structure_related_data",
                        priority: 3,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "how_is_a_struct_defined_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "class_user_{ … }", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_user_{ … }", isCorrect: true),
                                    Answer(id: UUID(),title: "object_user_{ … }", isCorrect: false),
                                    Answer(id: UUID(),title: "data_user_{ … }", isCorrect: false)
                                ],
                                descriptionText: "use_the_struct_keyword_with_braces_Rust_has_no_Java_Kotlin_style_class_or_object",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_are_fields_in_a_struct",
                                answers: [
                                    Answer(id: UUID(),title: "default_values", isCorrect: false),
                                    Answer(id: UUID(),title: "variables_inside_a_function", isCorrect: false),
                                    Answer(id: UUID(),title: "named_data_inside_a_struct", isCorrect: true),
                                    Answer(id: UUID(),title: "separate_methods_of_the_struct", isCorrect: false)
                                ],
                                descriptionText: "fields_are_the_components_of_a_struct_each_with_its_own_name_and_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_must_be_specified_when_declaring_a_field",
                                answers: [
                                    Answer(id: UUID(),title: "only_the_name", isCorrect: false),
                                    Answer(id: UUID(),title: "only_the_type", isCorrect: false),
                                    Answer(id: UUID(),title: "name_and_type", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing_Rust_infers_it", isCorrect: false)
                                ],
                                descriptionText: "struct_fields_always_specify_both_name_and_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_a_struct_instance",
                                answers: [
                                    Answer(id: UUID(),title: "User_true_name_email_1", isCorrect: false),
                                    Answer(id: UUID(),title: "User_active_true_username_email_sign_in_count_1", isCorrect: true),
                                    Answer(id: UUID(),title: "new_User", isCorrect: false),
                                    Answer(id: UUID(),title: "User_new_always", isCorrect: false)
                                ],
                                descriptionText: "a_struct_instance_is_created_with_key_value",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_you_change_the_fields_of_a_struct_instance",
                                answers: [
                                    Answer(id: UUID(),title: "always", isCorrect: false),
                                    Answer(id: UUID(),title: "only_if_the_field_itself_is_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "only_if_the_binding_the_whole_variable_is_mut", isCorrect: true),
                                    Answer(id: UUID(),title: "never", isCorrect: false)
                                ],
                                descriptionText: "in_Rust_mutability_is_set_for_the_whole_instance",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_access_a_struct_field",
                                answers: [
                                    Answer(id: UUID(),title: "user_email", isCorrect: false),
                                    Answer(id: UUID(),title: "user_email", isCorrect: false),
                                    Answer(id: UUID(),title: "user_email", isCorrect: true),
                                    Answer(id: UUID(),title: "email_user", isCorrect: false)
                                ],
                                descriptionText: "use_dot_notation",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_field_init_shorthand_do",
                                answers: [
                                    Answer(id: UUID(),title: "automatically_creates_getters", isCorrect: false),
                                    Answer(id: UUID(),title: "lets_you_omit_the_field_name_if_it_matches_the_parameter_name", isCorrect: true),
                                    Answer(id: UUID(),title: "automatically_makes_all_fields_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "duplicates_all_fields", isCorrect: false)
                                ],
                                descriptionText: "if_a_parameter_and_field_share_a_name_you_can_write_it_once",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_shorthand_call_look_like",
                                answers: [
                                    Answer(id: UUID(),title: "User_email_email_username_username", isCorrect: false),
                                    Answer(id: UUID(),title: "User_email_username", isCorrect: true),
                                    Answer(id: UUID(),title: "User_email_username", isCorrect: false),
                                    Answer(id: UUID(),title: "User_from_email_username", isCorrect: false)
                                ],
                                descriptionText: "Rust_expands_email_to_email_email",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_struct_update_syntax_do",
                                answers: [
                                    Answer(id: UUID(),title: "clones_a_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "creates_a_new_instance_by_changing_some_fields_and_copying_the_rest_from_another_instance", isCorrect: true),
                                    Answer(id: UUID(),title: "mutates_the_struct_in_place", isCorrect: false),
                                    Answer(id: UUID(),title: "deletes_fields", isCorrect: false)
                                ],
                                descriptionText: "use_other_struct",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_is_the_update_syntax_written",
                                answers: [
                                    Answer(id: UUID(),title: "User_email_x_user1", isCorrect: false),
                                    Answer(id: UUID(),title: "User_email_x_user1", isCorrect: true),
                                    Answer(id: UUID(),title: "User_update_user1_x", isCorrect: false),
                                    Answer(id: UUID(),title: "User_user1_email_x", isCorrect: false)
                                ],
                                descriptionText: "user1_copies_the_remaining_fields",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_to_user1_username_when_using_user1",
                                answers: [
                                    Answer(id: UUID(),title: "its_cloned", isCorrect: false),
                                    Answer(id: UUID(),title: "its_moved", isCorrect: true),
                                    Answer(id: UUID(),title: "it_remains_accessible", isCorrect: false),
                                    Answer(id: UUID(),title: "its_always_copied_even_if_its_a_String", isCorrect: false)
                                ],
                                descriptionText: "String_fields_are_moved",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_to_user1_active_if_its_a_bool",
                                answers: [
                                    Answer(id: UUID(),title: "its_moved", isCorrect: false),
                                    Answer(id: UUID(),title: "its_copied", isCorrect: true),
                                    Answer(id: UUID(),title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(),title: "dropped", isCorrect: false)
                                ],
                                descriptionText: "bool_implements_Copy",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_tuple_struct",
                                answers: [
                                    Answer(id: UUID(),title: "a_struct_without_fields", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_a_name_but_without_field_names", isCorrect: true),
                                    Answer(id: UUID(),title: "a_struct_of_only_bools", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_dynamic_fields", isCorrect: false)
                                ],
                                descriptionText: "fields_are_specified_only_by_types",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_tuple_struct",
                                answers: [
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: true),
                                    Answer(id: UUID(),title: "tuple_Color_i32_i32_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: false)
                                ],
                                descriptionText: "provide_the_name_and_types_in_parentheses",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_Color_and_Point_differ",
                                answers: [
                                    Answer(id: UUID(),title: "no_difference_theyre_aliases", isCorrect: false),
                                    Answer(id: UUID(),title: "theyre_different_types_even_if_they_have_identical_fields", isCorrect: true),
                                    Answer(id: UUID(),title: "the_only_difference_is_variable_names", isCorrect: false),
                                    Answer(id: UUID(),title: "Point_can_be_used_in_place_of_Color", isCorrect: false)
                                ],
                                descriptionText: "each_struct_is_a_distinct_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_unit_like_struct",
                                answers: [
                                    Answer(id: UUID(),title: "a_struct_with_one_field", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_no_fields", isCorrect: true),
                                    Answer(id: UUID(),title: "a_struct_with_str", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_thats_always_mut", isCorrect: false)
                                ],
                                descriptionText: "written_as_struct_Name",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_are_unit_like_structs_used_for",
                                answers: [
                                    Answer(id: UUID(),title: "storing_an_empty_string", isCorrect: false),
                                    Answer(id: UUID(),title: "implementing_traits_without_storing_data", isCorrect: true),
                                    Answer(id: UUID(),title: "saving_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "replacing_enums", isCorrect: false)
                                ],
                                descriptionText: "used_for_behavior_not_data",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_do_structs_usually_use_String_instead_of_str",
                                answers: [
                                    Answer(id: UUID(),title: "String_is_faster", isCorrect: false),
                                    Answer(id: UUID(),title: "String_is_always_smaller_in_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "so_the_struct_owns_its_data", isCorrect: true),
                                    Answer(id: UUID(),title: "to_avoid_writing_lifetimes", isCorrect: false)
                                ],
                                descriptionText: "String_owns_data_str_requires_a_lifetime",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_put_str_in_a_struct_without_a_lifetime",
                                answers: [
                                    Answer(id: UUID(),title: "compiles", isCorrect: false),
                                    Answer(id: UUID(),title: "error_missing_lifetime_specifier", isCorrect: true),
                                    Answer(id: UUID(),title: "always_works", isCorrect: false),
                                    Answer(id: UUID(),title: "automatically_becomes_String", isCorrect: false)
                                ],
                                descriptionText: "Rust_requires_lifetime_parameters_for_references",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_fix_a_struct_with_str",
                                answers: [
                                    Answer(id: UUID(),title: "struct_User_username_str", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_User_a_username_a_str", isCorrect: true),
                                    Answer(id: UUID(),title: "struct_User_username_str", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_User_static_str", isCorrect: false)
                                ],
                                descriptionText: "references_need_a_lifetime",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_area_width_height_inconvenient",
                                answers: [
                                    Answer(id: UUID(),title: "the_call_is_too_long", isCorrect: false),
                                    Answer(id: UUID(),title: "theres_no_relationship_between_the_parameters", isCorrect: true),
                                    Answer(id: UUID(),title: "Rust_doesnt_support_two_parameter_functions", isCorrect: false),
                                    Answer(id: UUID(),title: "its_slower", isCorrect: false)
                                ],
                                descriptionText: "width_and_height_arent_tied_together",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_a_tuple_inconvenient_for_a_rectangle",
                                answers: [
                                    Answer(id: UUID(),title: "no_field_names_only_indices", isCorrect: true),
                                    Answer(id: UUID(),title: "doesnt_support_multiplication", isCorrect: false),
                                    Answer(id: UUID(),title: "slower_than_a_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "doesnt_store_numbers", isCorrect: false)
                                ],
                                descriptionText: "with_tuples_you_must_remember_indices",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_struct_Rectangle_better_than_a_tuple",
                                answers: [
                                    Answer(id: UUID(),title: "stores_data_on_the_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "gives_field_names_width_and_height", isCorrect: true),
                                    Answer(id: UUID(),title: "can_only_be_used_in_main", isCorrect: false),
                                    Answer(id: UUID(),title: "always_gets_copied", isCorrect: false)
                                ],
                                descriptionText: "a_struct_adds_semantics",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_with_println_rect1",
                                answers: [
                                    Answer(id: UUID(),title: "it_prints_the_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "error_no_Display", isCorrect: true),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "always_works", isCorrect: false)
                                ],
                                descriptionText: "structs_dont_have_Display_by_default",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "whats_needed_for_debug_formatting",
                                answers: [
                                    Answer(id: UUID(),title: "implement_Display", isCorrect: false),
                                    Answer(id: UUID(),title: "use_and_derive_Debug", isCorrect: true),
                                    Answer(id: UUID(),title: "just_println", isCorrect: false),
                                    Answer(id: UUID(),title: "dbg_is_enough", isCorrect: false)
                                ],
                                descriptionText: "Debug_must_be_explicitly_enabled",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_dbg_differ_from_println",
                                answers: [
                                    Answer(id: UUID(),title: "dbg_always_colors_text", isCorrect: false),
                                    Answer(id: UUID(),title: "dbg_prints_to_stderr_and_returns_the_value", isCorrect: true),
                                    Answer(id: UUID(),title: "dbg_works_only_for_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "println_is_faster", isCorrect: false)
                                ],
                                descriptionText: "dbg_is_handy_for_debugging",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_method_for_a_struct",
                                answers: [
                                    Answer(id: UUID(),title: "fn_area_self", isCorrect: false),
                                    Answer(id: UUID(),title: "impl_Rectangle_fn_area_self", isCorrect: true),
                                    Answer(id: UUID(),title: "Rectangle_area_fn", isCorrect: false),
                                    Answer(id: UUID(),title: "method_Rectangle_area", isCorrect: false)
                                ],
                                descriptionText: "methods_live_inside_impl_blocks",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_a_function_differ_from_a_method",
                                answers: [
                                    Answer(id: UUID(),title: "a_method_always_returns_self", isCorrect: false),
                                    Answer(id: UUID(),title: "a_method_is_always_public", isCorrect: false),
                                    Answer(id: UUID(),title: "a_method_is_inside_impl_and_takes_self", isCorrect: true),
                                    Answer(id: UUID(),title: "a_function_works_only_in_main", isCorrect: false)
                                ],
                                descriptionText: "a_method_is_a_function_bound_to_a_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_self_mean",
                                answers: [
                                    Answer(id: UUID(),title: "the_method_takes_a_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "the_method_takes_a_reference_to_itself", isCorrect: true),
                                    Answer(id: UUID(),title: "the_method_requires_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "the_method_transfers_ownership", isCorrect: false)
                                ],
                                descriptionText: "self_is_sugar_for_self_Self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_method_that_changes_fields",
                                answers: [
                                    Answer(id: UUID(),title: "fn_change_self", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_change_mut_self", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_change_mut_self", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_change_self", isCorrect: false)
                                ],
                                descriptionText: "you_need_mut_self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_can_hold_method_do",
                                answers: [
                                    Answer(id: UUID(),title: "compares_two_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "checks_whether_one_Rectangle_fits_inside_another", isCorrect: true),
                                    Answer(id: UUID(),title: "creates_a_new_Rectangle", isCorrect: false),
                                    Answer(id: UUID(),title: "checks_Debug", isCorrect: false)
                                ],
                                descriptionText: "compares_width_and_height",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_call_a_method",
                                answers: [
                                    Answer(id: UUID(),title: "Rectangle_area_rect", isCorrect: false),
                                    Answer(id: UUID(),title: "rect_area", isCorrect: true),
                                    Answer(id: UUID(),title: "area_rect", isCorrect: false),
                                    Answer(id: UUID(),title: "rect_area", isCorrect: false)
                                ],
                                descriptionText: "use_instance_method",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_an_associated_function",
                                answers: [
                                    Answer(id: UUID(),title: "always_a_static_method", isCorrect: false),
                                    Answer(id: UUID(),title: "any_function_inside_impl", isCorrect: false),
                                    Answer(id: UUID(),title: "a_function_without_self", isCorrect: true),
                                    Answer(id: UUID(),title: "only_a_constructor", isCorrect: false)
                                ],
                                descriptionText: "an_associated_function_doesnt_take_self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_call_an_associated_function",
                                answers: [
                                    Answer(id: UUID(),title: "Rectangle_square_3", isCorrect: true),
                                    Answer(id: UUID(),title: "rect_square_3", isCorrect: false),
                                    Answer(id: UUID(),title: "new_Rectangle_3", isCorrect: false),
                                    Answer(id: UUID(),title: "square_Rectangle_3", isCorrect: false)
                                ],
                                descriptionText: "use_Type_func",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_Self_refer_to_in_an_impl",
                                answers: [
                                    Answer(id: UUID(),title: "empty_tuple", isCorrect: false),
                                    Answer(id: UUID(),title: "the_structs_type_name", isCorrect: true),
                                    Answer(id: UUID(),title: "static_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "void", isCorrect: false)
                                ],
                                descriptionText: "Self_equals_the_type_being_implemented",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_you_have_multiple_impl_blocks_for_one_struct",
                                answers: [
                                    Answer(id: UUID(),title: "no", isCorrect: false),
                                    Answer(id: UUID(),title: "yes_and_thats_valid_syntax", isCorrect: true),
                                    Answer(id: UUID(),title: "only_when_using_a_trait", isCorrect: false),
                                    Answer(id: UUID(),title: "only_on_nightly", isCorrect: false)
                                ],
                                descriptionText: "you_can_split_impls",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_if_a_method_and_a_field_share_a_name",
                                answers: [
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_distinguishes_them_rect_width_field_vs_rect_width_method", isCorrect: true),
                                    Answer(id: UUID(),title: "the_method_overwrites_the_field", isCorrect: false),
                                    Answer(id: UUID(),title: "the_field_becomes_private", isCorrect: false)
                                ],
                                descriptionText: "parentheses_indicate_a_method_call",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_getter_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "generated_automatically", isCorrect: false),
                                    Answer(id: UUID(),title: "you_write_it_manually_typically_returning_a_field", isCorrect: true),
                                    Answer(id: UUID(),title: "not_supported", isCorrect: false),
                                    Answer(id: UUID(),title: "created_via_a_macro", isCorrect: false)
                                ],
                                descriptionText: "Rust_doesnt_auto_generate_getters",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_Rust_replace_from_C",
                                answers: [
                                    Answer(id: UUID(),title: "Rust_also_uses", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_uses_auto_ref_deref_when_calling_methods", isCorrect: true),
                                    Answer(id: UUID(),title: "Rust_requires_before_the_call", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_always_copies", isCorrect: false)
                                ],
                                descriptionText: "Rust_auto_references_as_needed",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_dbg_print_for_dbg_30_2",
                                answers: [
                                    Answer(id: UUID(),title: "only_the_number", isCorrect: false),
                                    Answer(id: UUID(),title: "file_line_and_result", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false),
                                    Answer(id: UUID(),title: "compiler_error", isCorrect: false)
                                ],
                                descriptionText: "dbg_prints_context_value",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_the_pretty_debug_syntax",
                                answers: [
                                    Answer(id: UUID(),title: "pretty", isCorrect: true),
                                    Answer(id: UUID(),title: "debug", isCorrect: false),
                                    Answer(id: UUID(),title: "debug", isCorrect: false),
                                    Answer(id: UUID(),title: "debug", isCorrect: false)
                                ],
                                descriptionText: "pretty_print_is_pretty",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_impl_Rectangle_fn_new_Self_do",
                                answers: [
                                    Answer(id: UUID(),title: "not_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "defines_an_associated_function_constructor", isCorrect: true),
                                    Answer(id: UUID(),title: "defines_a_method", isCorrect: false),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "a_constructor_via_new",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "bottom_line_why_use_structs",
                                answers: [
                                    Answer(id: UUID(),title: "to_replace_enums", isCorrect: false),
                                    Answer(id: UUID(),title: "to_store_values_like_an_array", isCorrect: false),
                                    Answer(id: UUID(),title: "to_group_related_data_with_names_and_behavior", isCorrect: true),
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false)
                                ],
                                descriptionText: "a_struct_groups_data_and_methods",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "enums_and_pattern_matching",
                        priority: 4,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "what_does_an_enum_do_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "creates_an_array_of_values", isCorrect: false),
                                    Answer(id: UUID(),title: "lets_you_list_the_possible_variants_of_a_type", isCorrect: true),
                                    Answer(id: UUID(),title: "stores_only_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "works_like_a_struct_without_fields", isCorrect: false)
                                ],
                                descriptionText: "an_enum_defines_a_type_that_can_be_one_of_several_variants",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_an_enum_IpAddrKind_with_variants_V4_and_V6",
                                answers: [
                                    Answer(id: UUID(),title: "enum_IpAddrKind_V4_V6", isCorrect: true),
                                    Answer(id: UUID(),title: "enum_IpAddrKind_V4_V6", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_IpAddrKind_V4_V6", isCorrect: false),
                                    Answer(id: UUID(),title: "type_IpAddrKind_V4_V6", isCorrect: false)
                                ],
                                descriptionText: "enums_use_braces_with_listed_variants",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_an_enum_instance",
                                answers: [
                                    Answer(id: UUID(),title: "let_x_V4", isCorrect: false),
                                    Answer(id: UUID(),title: "let_x_IpAddrKind_V4", isCorrect: true),
                                    Answer(id: UUID(),title: "let_x_IpAddrKind_V4", isCorrect: false),
                                    Answer(id: UUID(),title: "let_x_new_IpAddrKind_V4", isCorrect: false)
                                ],
                                descriptionText: "variants_are_accessed_with",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_variants_of_an_enum_hold_data",
                                answers: [
                                    Answer(id: UUID(),title: "no", isCorrect: false),
                                    Answer(id: UUID(),title: "only_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "yes_any_type", isCorrect: true),
                                    Answer(id: UUID(),title: "only_strings", isCorrect: false)
                                ],
                                descriptionText: "enums_can_contain_different_kinds_of_data",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_enum_IpAddr_better_than_struct_IpAddrKind_String",
                                answers: [
                                    Answer(id: UUID(),title: "enums_are_faster", isCorrect: false),
                                    Answer(id: UUID(),title: "enums_are_clearer_and_shorter", isCorrect: true),
                                    Answer(id: UUID(),title: "enums_always_use_less_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "theres_no_difference", isCorrect: false)
                                ],
                                descriptionText: "an_enum_stores_the_kind_and_the_data_together",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_different_enum_variants_have_different_amounts_and_types_of_data",
                                answers: [
                                    Answer(id: UUID(),title: "no", isCorrect: false),
                                    Answer(id: UUID(),title: "yes", isCorrect: true),
                                    Answer(id: UUID(),title: "only_the_same_types", isCorrect: false),
                                    Answer(id: UUID(),title: "only_the_same_arity", isCorrect: false)
                                ],
                                descriptionText: "V4_u8_u8_u8_u8_and_V6_String_are_valid_together",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_Message_Quit_and_Message_Write_String_differ",
                                answers: [
                                    Answer(id: UUID(),title: "the_first_has_no_data_the_second_carries_data", isCorrect: true),
                                    Answer(id: UUID(),title: "theyre_the_same", isCorrect: false),
                                    Answer(id: UUID(),title: "Quit_is_always_a_String", isCorrect: false),
                                    Answer(id: UUID(),title: "Write_cant_be_used", isCorrect: false)
                                ],
                                descriptionText: "Quit_is_unit_like_Write_stores_a_String",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_you_add_methods_to_an_enum",
                                answers: [
                                    Answer(id: UUID(),title: "no", isCorrect: false),
                                    Answer(id: UUID(),title: "yes_via_impl", isCorrect: true),
                                    Answer(id: UUID(),title: "only_to_variants", isCorrect: false),
                                    Answer(id: UUID(),title: "only_if_the_enum_is_empty", isCorrect: false)
                                ],
                                descriptionText: "enums_support_impl_blocks",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_Option",
                                answers: [
                                    Answer(id: UUID(),title: "an_enum_for_storing_a_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "an_enum_representing_presence_or_absence_of_a_value", isCorrect: true),
                                    Answer(id: UUID(),title: "null_in_Rust", isCorrect: false),
                                    Answer(id: UUID(),title: "a_special_numeric_type", isCorrect: false)
                                ],
                                descriptionText: "Option_is_Some_T_or_None",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_true_about_Option",
                                answers: [
                                    Answer(id: UUID(),title: "Option_and_T_are_the_same_type", isCorrect: false),
                                    Answer(id: UUID(),title: "Option_and_T_are_different_types", isCorrect: true),
                                    Answer(id: UUID(),title: "you_can_add_Option_to_T_directly", isCorrect: false),
                                    Answer(id: UUID(),title: "Option_is_always_compiled_as_null", isCorrect: false)
                                ],
                                descriptionText: "you_mustnt_confuse_Option_with_T",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_doesnt_Rust_have_null",
                                answers: [
                                    Answer(id: UUID(),title: "to_save_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "personal_preference_of_the_authors", isCorrect: false),
                                    Answer(id: UUID(),title: "to_avoid_errors_the_billion_dollar_mistake", isCorrect: true),
                                    Answer(id: UUID(),title: "Rust_has_hidden_nulls", isCorrect: false)
                                ],
                                descriptionText: "null_often_leads_to_bugs",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_get_a_value_out_of_an_Option",
                                answers: [
                                    Answer(id: UUID(),title: "always_unwrap", isCorrect: false),
                                    Answer(id: UUID(),title: "with_match_or_helper_methods", isCorrect: true),
                                    Answer(id: UUID(),title: "automatically_when_adding", isCorrect: false),
                                    Answer(id: UUID(),title: "using_a_null_check", isCorrect: false)
                                ],
                                descriptionText: "typically_use_match_if_let_or_methods",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_match_construct_do",
                                answers: [
                                    Answer(id: UUID(),title: "checks_only_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "compares_a_value_against_patterns", isCorrect: true),
                                    Answer(id: UUID(),title: "always_replaces_if", isCorrect: false),
                                    Answer(id: UUID(),title: "works_only_with_numbers", isCorrect: false)
                                ],
                                descriptionText: "match_matches_a_value_to_patterns",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_match_differ_from_if",
                                answers: [
                                    Answer(id: UUID(),title: "match_is_faster", isCorrect: false),
                                    Answer(id: UUID(),title: "if_checks_a_bool_match_works_with_any_value", isCorrect: true),
                                    Answer(id: UUID(),title: "if_requires_all_branches_match_doesnt", isCorrect: false),
                                    Answer(id: UUID(),title: "if_can_store_data_match_cant", isCorrect: false)
                                ],
                                descriptionText: "match_works_with_many_types_not_just_bool",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_arrow_mean_in_match",
                                answers: [
                                    Answer(id: UUID(),title: "assignment", isCorrect: false),
                                    Answer(id: UUID(),title: "condition", isCorrect: false),
                                    Answer(id: UUID(),title: "separates_the_pattern_from_its_arms_code", isCorrect: true),
                                    Answer(id: UUID(),title: "typing", isCorrect: false)
                                ],
                                descriptionText: "code_for_the_arm_goes_after",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_dont_cover_all_enum_variants_in_a_match",
                                answers: [
                                    Answer(id: UUID(),title: "compiles_with_a_warning", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(),title: "a_default_is_added_automatically", isCorrect: false),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false)
                                ],
                                descriptionText: "match_must_be_exhaustive_in_Rust",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_used_for_in_match",
                                answers: [
                                    Answer(id: UUID(),title: "printing_a_value", isCorrect: false),
                                    Answer(id: UUID(),title: "catch_all_any_remaining_case", isCorrect: true),
                                    Answer(id: UUID(),title: "comments", isCorrect: false),
                                    Answer(id: UUID(),title: "calling_a_method", isCorrect: false)
                                ],
                                descriptionText: "ignores_the_value_and_matches_anything",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_match_x_Some_i_i_0_do",
                                answers: [
                                    Answer(id: UUID(),title: "always_returns_i", isCorrect: false),
                                    Answer(id: UUID(),title: "returns_i_or_0_if_None", isCorrect: true),
                                    Answer(id: UUID(),title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(),title: "returns_null", isCorrect: false)
                                ],
                                descriptionText: "covers_the_None_case",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "whats_the_advantage_of_if_let_over_match",
                                answers: [
                                    Answer(id: UUID(),title: "ensures_exhaustiveness", isCorrect: false),
                                    Answer(id: UUID(),title: "shorter_when_handling_a_single_variant", isCorrect: true),
                                    Answer(id: UUID(),title: "works_only_with_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "no_advantage", isCorrect: false)
                                ],
                                descriptionText: "if_let_is_handy_when_you_care_about_one_case",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_do_you_lose_when_using_if_let_instead_of_match",
                                answers: [
                                    Answer(id: UUID(),title: "performance", isCorrect: false),
                                    Answer(id: UUID(),title: "automatic_coverage_of_all_cases", isCorrect: true),
                                    Answer(id: UUID(),title: "ability_to_use_Option", isCorrect: false),
                                    Answer(id: UUID(),title: "the_call_method", isCorrect: false)
                                ],
                                descriptionText: "if_let_doesnt_require_handling_all_variants",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_let_else_differ_from_if_let",
                                answers: [
                                    Answer(id: UUID(),title: "let_else_is_always_faster", isCorrect: false),
                                    Answer(id: UUID(),title: "let_else_requires_the_else_branch_to_exit_e_g_return", isCorrect: true),
                                    Answer(id: UUID(),title: "let_else_works_only_with_Option", isCorrect: false),
                                    Answer(id: UUID(),title: "no_difference", isCorrect: false)
                                ],
                                descriptionText: "in_let_else_the_else_must_terminate_the_function",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_data_binding_work_in_match",
                                answers: [
                                    Answer(id: UUID(),title: "you_cant_extract_data", isCorrect: false),
                                    Answer(id: UUID(),title: "through_variables_in_the_pattern", isCorrect: true),
                                    Answer(id: UUID(),title: "only_via_unwrap", isCorrect: false),
                                    Answer(id: UUID(),title: "only_via_Option_methods", isCorrect: false)
                                ],
                                descriptionText: "Coin_Quarter_state_println_state",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_this_code_do_if_let_Some_x_y",
                                answers: [
                                    Answer(id: UUID(),title: "always_prints_y", isCorrect: false),
                                    Answer(id: UUID(),title: "prints_x_if_y_Some_x", isCorrect: true),
                                    Answer(id: UUID(),title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(),title: "works_only_for_numbers", isCorrect: false)
                                ],
                                descriptionText: "if_let_extracts_the_value_from_Some",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "bottom_line_why_use_enum_match",
                                answers: [
                                    Answer(id: UUID(),title: "to_replace_structs", isCorrect: false),
                                    Answer(id: UUID(),title: "to_store_only_strings", isCorrect: false),
                                    Answer(id: UUID(),title: "to_express_a_set_of_variants_and_handle_them_safely", isCorrect: true),
                                    Answer(id: UUID(),title: "to_speed_up_println", isCorrect: false)
                                ],
                                descriptionText: "enums_describe_variants_match_handles_them_reliably",
                                descriptionLink: "enums_and_pattern_matching_link"
                            ),
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "managing_growing_projects_with_packages_crates_and_modules",
                        priority: 5,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_is_a_crate_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "the_cargo_toml_file", isCorrect: false),
                                    Answer(id: UUID(), title: "the_smallest_unit_of_code_for_compilation", isCorrect: true),
                                    Answer(id: UUID(), title: "only_a_binary_executable", isCorrect: false),
                                    Answer(id: UUID(), title: "a_separate_package_with_dependencies", isCorrect: false)
                                ],
                                descriptionText: "a_crate_is_the_minimal_compilation_unit_even_a_single_rs_file_compiles_as_a_crate",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "what_kinds_of_crates_exist",
                                answers: [
                                    Answer(id: UUID(), title: "library_only", isCorrect: false),
                                    Answer(id: UUID(), title: "binary_only", isCorrect: false),
                                    Answer(id: UUID(), title: "binary_and_library", isCorrect: true),
                                    Answer(id: UUID(), title: "module_only", isCorrect: false)
                                ],
                                descriptionText: "crates_come_in_two_types_binary_with_main_and_library_without_main",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "what_must_a_binary_crate_contain",
                                answers: [
                                    Answer(id: UUID(), title: "a_cargo_toml_file", isCorrect: false),
                                    Answer(id: UUID(), title: "main_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "a_main_function", isCorrect: true),
                                    Answer(id: UUID(), title: "a_lib_module", isCorrect: false)
                                ],
                                descriptionText: "a_binary_crate_requires_fn_main_as_the_entry_point",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_does_a_library_crate_conventionally_specify",
                                answers: [
                                    Answer(id: UUID(), title: "a_main_entry_point", isCorrect: false),
                                    Answer(id: UUID(), title: "the_file_src_lib_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_lock", isCorrect: false),
                                    Answer(id: UUID(), title: "a_separate_front_of_house_module", isCorrect: false)
                                ],
                                descriptionText: "by_convention_a_library_starts_at_src_lib_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "what_is_the_crate_root",
                                answers: [
                                    Answer(id: UUID(), title: "the_projects_root_directory", isCorrect: false),
                                    Answer(id: UUID(), title: "the_first_module_where_the_compiler_starts", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "the_target_folder", isCorrect: false)
                                ],
                                descriptionText: "src_main_rs_or_src_lib_rs_is_the_crate_root_from_which_the_module_tree_is_built",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_is_a_package",
                                answers: [
                                    Answer(id: UUID(), title: "any_binary_crate", isCorrect: false),
                                    Answer(id: UUID(), title: "a_group_of_modules", isCorrect: false),
                                    Answer(id: UUID(), title: "a_bundle_of_one_or_more_crates_with_a_cargo_toml", isCorrect: true),
                                    Answer(id: UUID(), title: "a_workspace", isCorrect: false)
                                ],
                                descriptionText: "a_package_is_a_set_of_crates_plus_cargo_toml_describing_how_to_build_them",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "how_many_library_crates_can_a_package_have",
                                answers: [
                                    Answer(id: UUID(), title: "any_number", isCorrect: false),
                                    Answer(id: UUID(), title: "at_most_one", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_there_are_no_binaries", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_cargo_toml", isCorrect: false)
                                ],
                                descriptionText: "a_package_may_contain_many_binary_crates_but_only_one_library_crate",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "where_does_cargo_look_for_the_binary_crate_root",
                                answers: [
                                    Answer(id: UUID(), title: "src_bin_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_bin_mod_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_main_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "src_root_rs", isCorrect: false)
                                ],
                                descriptionText: "by_default_a_binary_crate_starts_at_src_main_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "where_does_cargo_look_for_the_library_crate_root",
                                answers: [
                                    Answer(id: UUID(), title: "src_main_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_root_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_lib_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "lib_toml", isCorrect: false)
                                ],
                                descriptionText: "a_library_crate_is_defined_in_src_lib_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_a_new_project_with_a_binary_crate",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_create", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_new_myproj", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_init_lib", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_bin_myproj", isCorrect: false)
                                ],
                                descriptionText: "cargo_new_creates_a_binary_crate_by_default",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_a_new_project_with_a_library_crate",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_new_mylib", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_new_mylib_lib", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_lib_mylib", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_init_bin", isCorrect: false)
                                ],
                                descriptionText: "the_lib_flag_tells_cargo_to_create_a_library",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "what_does_the_mod_keyword_do",
                                answers: [
                                    Answer(id: UUID(), title: "brings_in_an_external_crate", isCorrect: false),
                                    Answer(id: UUID(), title: "declares_a_module", isCorrect: true),
                                    Answer(id: UUID(), title: "makes_a_function_public", isCorrect: false),
                                    Answer(id: UUID(), title: "adds_a_dependency", isCorrect: false)
                                ],
                                descriptionText: "mod_is_used_to_declare_a_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "where_is_code_for_mod_garden_searched",
                                answers: [
                                    Answer(id: UUID(), title: "only_in_src_garden_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_garden_rs_or_src_garden_mod_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "only_inside_main_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_cargo_toml", isCorrect: false)
                                ],
                                descriptionText: "the_compiler_checks_two_paths_garden_rs_or_garden_mod_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "what_does_pub_mod_mean",
                                answers: [
                                    Answer(id: UUID(), title: "makes_the_module_and_all_its_contents_public", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_the_module_accessible_from_outside", isCorrect: true),
                                    Answer(id: UUID(), title: "removes_privacy_from_all_functions", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_a_new_binary_crate", isCorrect: false)
                                ],
                                descriptionText: "pub_mod_exposes_the_module_its_contents_remain_private_by_default",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "whats_the_default_visibility_for_modules_and_functions",
                                answers: [
                                    Answer(id: UUID(), title: "public", isCorrect: false),
                                    Answer(id: UUID(), title: "private", isCorrect: true),
                                    Answer(id: UUID(), title: "protected", isCorrect: false),
                                    Answer(id: UUID(), title: "internal", isCorrect: false)
                                ],
                                descriptionText: "in_rust_everything_is_private_by_default",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "what_is_true_of_an_absolute_path",
                                answers: [
                                    Answer(id: UUID(), title: "starts_with_self", isCorrect: false),
                                    Answer(id: UUID(), title: "starts_with_super", isCorrect: false),
                                    Answer(id: UUID(), title: "starts_with_crate", isCorrect: true),
                                    Answer(id: UUID(), title: "always_starts_with_lib", isCorrect: false)
                                ],
                                descriptionText: "an_absolute_path_starts_with_crate_or_an_external_crate_name",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "what_is_true_of_a_relative_path",
                                answers: [
                                    Answer(id: UUID(), title: "starts_with_crate", isCorrect: false),
                                    Answer(id: UUID(), title: "starts_with_self_or_super", isCorrect: true),
                                    Answer(id: UUID(), title: "always_starts_with_pub", isCorrect: false),
                                    Answer(id: UUID(), title: "can_only_be_used_in_lib_rs", isCorrect: false)
                                ],
                                descriptionText: "relative_paths_are_built_from_the_current_module_via_self_super_or_identifiers",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "how_does_use_differ_from_pub_use",
                                answers: [
                                    Answer(id: UUID(), title: "use_works_only_in_binaries", isCorrect: false),
                                    Answer(id: UUID(), title: "pub_use_performs_a_re_export", isCorrect: true),
                                    Answer(id: UUID(), title: "pub_use_is_only_for_std", isCorrect: false),
                                    Answer(id: UUID(), title: "use_cant_be_used_in_lib_rs", isCorrect: false)
                                ],
                                descriptionText: "use_brings_a_name_into_scope_pub_use_also_makes_it_accessible_to_external_users",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "which_privacy_rule_is_correct",
                                answers: [
                                    Answer(id: UUID(), title: "a_parent_sees_a_childs_private_items", isCorrect: false),
                                    Answer(id: UUID(), title: "a_child_sees_its_parent", isCorrect: true),
                                    Answer(id: UUID(), title: "everyone_sees_everyone", isCorrect: false),
                                    Answer(id: UUID(), title: "privacy_applies_only_to_functions", isCorrect: false)
                                ],
                                descriptionText: "a_parent_cannot_access_a_childs_private_items_but_the_child_can_access_the_parent",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "what_does_the_keyword_super_do",
                                answers: [
                                    Answer(id: UUID(), title: "brings_in_std", isCorrect: false),
                                    Answer(id: UUID(), title: "refers_to_the_parent_module", isCorrect: true),
                                    Answer(id: UUID(), title: "makes_a_struct_public", isCorrect: false),
                                    Answer(id: UUID(), title: "overrides_pub", isCorrect: false)
                                ],
                                descriptionText: "super_means_go_up_one_level_in_the_module_tree",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "how_do_struct_and_enum_differ_with_pub",
                                answers: [
                                    Answer(id: UUID(), title: "struct_fields_are_public_by_default", isCorrect: false),
                                    Answer(id: UUID(), title: "all_enum_variants_become_public", isCorrect: true),
                                    Answer(id: UUID(), title: "enum_variants_are_private", isCorrect: false),
                                    Answer(id: UUID(), title: "struct_fields_cant_be_made_private", isCorrect: false)
                                ],
                                descriptionText: "if_an_enum_is_public_all_its_variants_are_public",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "what_happens_with_pub_struct_s_x_i32",
                                answers: [
                                    Answer(id: UUID(), title: "field_x_is_public", isCorrect: false),
                                    Answer(id: UUID(), title: "field_x_is_private", isCorrect: true),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(), title: "everything_is_public", isCorrect: false)
                                ],
                                descriptionText: "even_with_pub_struct_fields_are_private_by_default",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "what_does_use_std_collections_hashmap_do",
                                answers: [
                                    Answer(id: UUID(), title: "imports_all_of_std", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_hashmap_available_by_its_name", isCorrect: true),
                                    Answer(id: UUID(), title: "creates_a_new_crate", isCorrect: false),
                                    Answer(id: UUID(), title: "imports_the_entire_collections_module", isCorrect: false)
                                ],
                                descriptionText: "use_shortens_the_path_to_refer_to_hashmap_directly",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "how_to_import_two_items_from_std_correctly",
                                answers: [
                                    Answer(id: UUID(), title: "use_std_io_use_std_cmp", isCorrect: false),
                                    Answer(id: UUID(), title: "use_std_io_cmp", isCorrect: true),
                                    Answer(id: UUID(), title: "use_std_io_cmp_semicolon", isCorrect: false),
                                    Answer(id: UUID(), title: "use_std_io_cmp_parentheses", isCorrect: false)
                                ],
                                descriptionText: "nested_paths_reduce_repetition",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "what_does_use_std_io_self_write_do",
                                answers: [
                                    Answer(id: UUID(), title: "imports_only_write", isCorrect: false),
                                    Answer(id: UUID(), title: "imports_io_and_write", isCorrect: true),
                                    Answer(id: UUID(), title: "imports_everything_from_io", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: false)
                                ],
                                descriptionText: "self_refers_to_the_module_itself_you_import_both_io_and_write",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "what_does_asterisk_do_with_use",
                                answers: [
                                    Answer(id: UUID(), title: "imports_only_pub_use", isCorrect: false),
                                    Answer(id: UUID(), title: "imports_all_public_items", isCorrect: true),
                                    Answer(id: UUID(), title: "imports_private_items", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_an_alias", isCorrect: false)
                                ],
                                descriptionText: "asterisk_imports_all_public_items_from_a_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "when_is_glob_asterisk_often_used",
                                answers: [
                                    Answer(id: UUID(), title: "in_main_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "in_tests", isCorrect: true),
                                    Answer(id: UUID(), title: "in_cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "in_enums", isCorrect: false)
                                ],
                                descriptionText: "asterisk_is_commonly_used_in_a_tests_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "what_does_as_do_in_use",
                                answers: [
                                    Answer(id: UUID(), title: "makes_it_private", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_an_alias", isCorrect: true),
                                    Answer(id: UUID(), title: "exports_it_outward", isCorrect: false),
                                    Answer(id: UUID(), title: "replaces_super", isCorrect: false)
                                ],
                                descriptionText: "as_lets_you_rename_an_import",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "what_happens_on_a_name_conflict",
                                answers: [
                                    Answer(id: UUID(), title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(), title: "rust_takes_the_first", isCorrect: false),
                                    Answer(id: UUID(), title: "rust_takes_the_last", isCorrect: false),
                                    Answer(id: UUID(), title: "an_alias_is_created_automatically", isCorrect: false)
                                ],
                                descriptionText: "rust_doesnt_allow_the_same_name_twice_in_one_scope",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "how_do_you_add_the_external_crate_rand",
                                answers: [
                                    Answer(id: UUID(), title: "use_rand_in_cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "rand_0_8_in_cargo_toml", isCorrect: true),
                                    Answer(id: UUID(), title: "mod_rand", isCorrect: false),
                                    Answer(id: UUID(), title: "extern_rand", isCorrect: false)
                                ],
                                descriptionText: "external_crates_are_added_as_dependencies_in_cargo_toml",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "what_is_needed_to_use_rand_thread_rng",
                                answers: [
                                    Answer(id: UUID(), title: "use_rand_rng", isCorrect: true),
                                    Answer(id: UUID(), title: "mod_rand", isCorrect: false),
                                    Answer(id: UUID(), title: "pub_use_rand", isCorrect: false),
                                    Answer(id: UUID(), title: "extern_crate_rng", isCorrect: false)
                                ],
                                descriptionText: "you_must_import_the_traits_for_the_methods_to_work",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "how_is_the_standard_library_included",
                                answers: [
                                    Answer(id: UUID(), title: "automatically", isCorrect: true),
                                    Answer(id: UUID(), title: "through_cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "via_extern_crate_std", isCorrect: false),
                                    Answer(id: UUID(), title: "via_pub_mod", isCorrect: false)
                                ],
                                descriptionText: "std_is_included_automatically_but_you_must_use_items_into_scope",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "where_is_a_crates_module_structure_stored",
                                answers: [
                                    Answer(id: UUID(), title: "in_cargo_lock", isCorrect: false),
                                    Answer(id: UUID(), title: "in_the_mod_tree", isCorrect: true),
                                    Answer(id: UUID(), title: "in_cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "in_bin", isCorrect: false)
                                ],
                                descriptionText: "the_crate_builds_a_module_tree_starting_at_the_crate_root",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 34
                            Question(
                                id: UUID(),
                                title: "what_is_a_re_export",
                                answers: [
                                    Answer(id: UUID(), title: "a_new_crate", isCorrect: false),
                                    Answer(id: UUID(), title: "pub_use", isCorrect: true),
                                    Answer(id: UUID(), title: "an_alias", isCorrect: false),
                                    Answer(id: UUID(), title: "pub_mod", isCorrect: false)
                                ],
                                descriptionText: "re_exporting_pub_use_simplifies_a_public_api",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 35
                            Question(
                                id: UUID(),
                                title: "whats_the_idiomatic_way_to_import_a_function",
                                answers: [
                                    Answer(id: UUID(), title: "use_path_to_func", isCorrect: false),
                                    Answer(id: UUID(), title: "use_path_to_module_module_func", isCorrect: true),
                                    Answer(id: UUID(), title: "always_via_asterisk", isCorrect: false),
                                    Answer(id: UUID(), title: "via_self", isCorrect: false)
                                ],
                                descriptionText: "idiomatic_rust_imports_the_module_then_calls_module_func",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 36
                            Question(
                                id: UUID(),
                                title: "where_is_a_module_file_searched",
                                answers: [
                                    Answer(id: UUID(), title: "only_mod_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "file_rs_or_dir_mod_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_src_bin", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_cargo_toml", isCorrect: false)
                                ],
                                descriptionText: "rust_supports_both_styles_file_rs_and_dir_mod_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 37
                            Question(
                                id: UUID(),
                                title: "what_if_you_create_both_file_rs_and_dir_mod_rs_for_the_same_module",
                                answers: [
                                    Answer(id: UUID(), title: "the_first_is_used", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(), title: "everything_works", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_chooses_automatically", isCorrect: false)
                                ],
                                descriptionText: "rust_doesnt_allow_both_variants_for_a_single_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 38
                            Question(
                                id: UUID(),
                                title: "where_is_the_module_tree_usually_written",
                                answers: [
                                    Answer(id: UUID(), title: "in_cargo_lock", isCorrect: false),
                                    Answer(id: UUID(), title: "in_lib_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "in_bin", isCorrect: false),
                                    Answer(id: UUID(), title: "in_target", isCorrect: false)
                                ],
                                descriptionText: "the_module_structure_is_declared_in_the_crate_root_lib_rs_or_main_rs",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 39
                            Question(
                                id: UUID(),
                                title: "what_does_a_use_apply_to_by_default",
                                answers: [
                                    Answer(id: UUID(), title: "works_everywhere", isCorrect: false),
                                    Answer(id: UUID(), title: "only_within_the_current_module", isCorrect: true),
                                    Answer(id: UUID(), title: "automatically_propagates", isCorrect: false),
                                    Answer(id: UUID(), title: "always_global", isCorrect: false)
                                ],
                                descriptionText: "use_is_limited_to_the_current_scope",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 40
                            Question(
                                id: UUID(),
                                title: "how_does_a_workspace_differ_from_a_package",
                                answers: [
                                    Answer(id: UUID(), title: "a_workspace_is_a_set_of_packages", isCorrect: true),
                                    Answer(id: UUID(), title: "a_package_is_a_set_of_workspaces", isCorrect: false),
                                    Answer(id: UUID(), title: "they_are_the_same", isCorrect: false),
                                    Answer(id: UUID(), title: "a_workspace_binaries_only", isCorrect: false)
                                ],
                                descriptionText: "a_workspace_is_a_collection_of_multiple_packages",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 41
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_multiple_binary_crates_in_one_package",
                                answers: [
                                    Answer(id: UUID(), title: "put_files_in_src_bin", isCorrect: true),
                                    Answer(id: UUID(), title: "in_cargo_toml_bin", isCorrect: false),
                                    Answer(id: UUID(), title: "in_lib_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "in_cargo_lock", isCorrect: false)
                                ],
                                descriptionText: "each_file_in_src_bin_becomes_a_separate_binary_crate",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 42
                            Question(
                                id: UUID(),
                                title: "what_does_self_mean_in_a_path",
                                answers: [
                                    Answer(id: UUID(), title: "refers_to_the_parent", isCorrect: false),
                                    Answer(id: UUID(), title: "refers_to_the_current_module", isCorrect: true),
                                    Answer(id: UUID(), title: "imports_private_items", isCorrect: false),
                                    Answer(id: UUID(), title: "points_to_the_crate", isCorrect: false)
                                ],
                                descriptionText: "self_equals_the_current_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 43
                            Question(
                                id: UUID(),
                                title: "whats_the_default_for_pub_enum",
                                answers: [
                                    Answer(id: UUID(), title: "variants_are_private", isCorrect: false),
                                    Answer(id: UUID(), title: "all_variants_are_public", isCorrect: true),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(), title: "nothing_changes", isCorrect: false)
                                ],
                                descriptionText: "for_an_enum_making_it_pub_makes_all_its_variants_public",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 44
                            Question(
                                id: UUID(),
                                title: "what_is_true_about_a_struct",
                                answers: [
                                    Answer(id: UUID(), title: "all_fields_are_public", isCorrect: false),
                                    Answer(id: UUID(), title: "fields_are_private_by_default", isCorrect: true),
                                    Answer(id: UUID(), title: "fields_are_always_public", isCorrect: false),
                                    Answer(id: UUID(), title: "fields_are_hidden_only_with_mod", isCorrect: false)
                                ],
                                descriptionText: "even_with_pub_struct_fields_are_private_unless_marked_pub",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 45
                            Question(
                                id: UUID(),
                                title: "whats_the_idiomatic_use_for_hashmap",
                                answers: [
                                    Answer(id: UUID(), title: "use_std_hashmap_new", isCorrect: false),
                                    Answer(id: UUID(), title: "use_std_collections_hashmap", isCorrect: true),
                                    Answer(id: UUID(), title: "use_std_hashmap", isCorrect: false),
                                    Answer(id: UUID(), title: "pub_use_std_hashmap", isCorrect: false)
                                ],
                                descriptionText: "idiomatic_is_to_import_the_full_path_to_the_type",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 46
                            Question(
                                id: UUID(),
                                title: "what_happens_with_use_std_fmt_result_and_use_std_io_result",
                                answers: [
                                    Answer(id: UUID(), title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(), title: "the_first_is_chosen", isCorrect: false),
                                    Answer(id: UUID(), title: "the_last_is_chosen", isCorrect: false),
                                    Answer(id: UUID(), title: "automatic_alias", isCorrect: false)
                                ],
                                descriptionText: "you_cant_import_two_items_with_the_same_name_into_one_scope",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 47
                            Question(
                                id: UUID(),
                                title: "how_to_resolve_the_result_name_conflict",
                                answers: [
                                    Answer(id: UUID(), title: "use_pub_mod", isCorrect: false),
                                    Answer(id: UUID(), title: "use_as_for_an_alias", isCorrect: true),
                                    Answer(id: UUID(), title: "use_only_glob", isCorrect: false),
                                    Answer(id: UUID(), title: "remove_one_import", isCorrect: false)
                                ],
                                descriptionText: "as_lets_you_rename_eg_ioresult",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 48
                            Question(
                                id: UUID(),
                                title: "what_does_pub_use_hosting_do",
                                answers: [
                                    Answer(id: UUID(), title: "imports_only_locally", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_the_name_hosting_available_both_internally_and_externally", isCorrect: true),
                                    Answer(id: UUID(), title: "deletes_the_hosting_module", isCorrect: false),
                                    Answer(id: UUID(), title: "duplicates_hosting_code", isCorrect: false)
                                ],
                                descriptionText: "plain_use_is_local_pub_use_re_exports_making_it_part_of_the_public_api",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 49
                            Question(
                                id: UUID(),
                                title: "what_does_pub_use_crate_front_of_house_hosting_do",
                                answers: [
                                    Answer(id: UUID(), title: "makes_hosting_visible_only_in_the_current_file", isCorrect: false),
                                    Answer(id: UUID(), title: "exports_hosting_outward_as_part_of_the_public_api", isCorrect: true),
                                    Answer(id: UUID(), title: "imports_hosting_for_tests_only", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_a_new_module", isCorrect: false)
                                ],
                                descriptionText: "pub_use_shortens_the_internal_path_and_re_exports_the_name_for_external_use",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 50
                            Question(
                                id: UUID(),
                                title: "what_happens_if_lib_rs_has_mod_garden_but_theres_no_garden_rs_or_garden_mod_rs",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_creates_an_empty_module", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(), title: "the_module_is_private", isCorrect: false),
                                    Answer(id: UUID(), title: "rust_ignores_the_module", isCorrect: false)
                                ],
                                descriptionText: "mod_tells_the_compiler_to_find_a_file_if_its_missing_thats_an_error",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 51
                            Question(
                                id: UUID(),
                                title: "how_do_you_properly_move_submodule_hosting_to_a_separate_file",
                                answers: [
                                    Answer(id: UUID(), title: "src_hosting_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "src_front_of_house_hosting_rs", isCorrect: true),
                                    Answer(id: UUID(), title: "src_bin_hosting_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "lib_hosting_rs", isCorrect: false)
                                ],
                                descriptionText: "child_modules_must_live_under_the_directory_of_their_parent_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 52
                            Question(
                                id: UUID(),
                                title: "what_about_the_mod_rs_style",
                                answers: [
                                    Answer(id: UUID(), title: "deprecated_but_still_supported", isCorrect: true),
                                    Answer(id: UUID(), title: "mandatory_in_all_projects", isCorrect: false),
                                    Answer(id: UUID(), title: "completely_replaced_garden_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "works_only_in_a_workspace", isCorrect: false)
                                ],
                                descriptionText: "mod_rs_src_garden_mod_rs_is_the_older_style_and_still_supported",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 53
                            Question(
                                id: UUID(),
                                title: "what_if_both_garden_rs_and_garden_mod_rs_exist",
                                answers: [
                                    Answer(id: UUID(), title: "rust_merges_them", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_chooses_garden_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_chooses_mod_rs", isCorrect: false)
                                ],
                                descriptionText: "rust_forbids_defining_one_module_in_two_places",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 54
                            Question(
                                id: UUID(),
                                title: "what_does_glob_use_std_collections_asterisk_do",
                                answers: [
                                    Answer(id: UUID(), title: "imports_all_public_items_from_collections", isCorrect: true),
                                    Answer(id: UUID(), title: "imports_only_hashmap", isCorrect: false),
                                    Answer(id: UUID(), title: "imports_private_items_too", isCorrect: false),
                                    Answer(id: UUID(), title: "only_enums", isCorrect: false)
                                ],
                                descriptionText: "asterisk_pulls_in_all_public_items_of_the_module",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 55
                            Question(
                                id: UUID(),
                                title: "when_should_you_avoid_glob_asterisk",
                                answers: [
                                    Answer(id: UUID(), title: "in_small_files", isCorrect: false),
                                    Answer(id: UUID(), title: "when_you_need_to_see_explicitly_what_is_imported", isCorrect: true),
                                    Answer(id: UUID(), title: "when_working_with_std", isCorrect: false),
                                    Answer(id: UUID(), title: "when_theres_no_pub_use", isCorrect: false)
                                ],
                                descriptionText: "glob_can_obscure_which_items_are_in_scope",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 56
                            Question(
                                id: UUID(),
                                title: "where_is_glob_most_often_used",
                                answers: [
                                    Answer(id: UUID(), title: "in_tests", isCorrect: true),
                                    Answer(id: UUID(), title: "in_cargo_toml", isCorrect: false),
                                    Answer(id: UUID(), title: "in_a_workspace", isCorrect: false),
                                    Answer(id: UUID(), title: "in_bin", isCorrect: false)
                                ],
                                descriptionText: "its_commonly_used_in_the_tests_module_to_import_everything",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            ),
                            
                            // Question 57
                            Question(
                                id: UUID(),
                                title: "which_statement_best_describes_rusts_module_system",
                                answers: [
                                    Answer(id: UUID(), title: "its_only_about_pub_private", isCorrect: false),
                                    Answer(id: UUID(), title: "its_the_combination_of_packages_crates_modules_paths_and_use", isCorrect: true),
                                    Answer(id: UUID(), title: "its_an_analog_of_c_plus_plus_include", isCorrect: false),
                                    Answer(id: UUID(), title: "its_only_about_workspaces", isCorrect: false)
                                ],
                                descriptionText: "rusts_module_system_encompasses_all_code_organization_mechanisms_packages_crates_modules_pub_use_and_paths",
                                descriptionLink: "managing_growing_projects_with_packages_crates_and_modules_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "common_collections",
                        priority: 6,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_is_vec_t_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "a_fixed_size_stack_array", isCorrect: false),
                                    Answer(id: UUID(), title: "a_dynamic_heap_array", isCorrect: true),
                                    Answer(id: UUID(), title: "an_associative_array", isCorrect: false),
                                    Answer(id: UUID(), title: "a_utf_8_string", isCorrect: false)
                                ],
                                descriptionText: "vec_t_stores_data_on_the_heap_its_size_can_change_at_runtime",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_an_empty_i32_vector",
                                answers: [
                                    Answer(id: UUID(), title: "let_v_vec_new", isCorrect: true),
                                    Answer(id: UUID(), title: "let_v_empty_brackets", isCorrect: false),
                                    Answer(id: UUID(), title: "let_v_vec_empty", isCorrect: false),
                                    Answer(id: UUID(), title: "let_v_array_macro", isCorrect: false)
                                ],
                                descriptionText: "vec_new_creates_an_empty_vector_the_type_is_via_annotation_or_later_inference",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "macro_to_create_a_vector_with_elements",
                                answers: [
                                    Answer(id: UUID(), title: "vec_macro", isCorrect: true),
                                    Answer(id: UUID(), title: "array_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "make_vec_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "collection_macro", isCorrect: false)
                                ],
                                descriptionText: "vec_is_the_built_in_macro_for_vector_literals",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_does_v_2_return_if_v_vec_1_2_3",
                                answers: [
                                    Answer(id: UUID(), title: "some_3", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_3", isCorrect: true),
                                    Answer(id: UUID(), title: "value_3", isCorrect: false),
                                    Answer(id: UUID(), title: "option_i32", isCorrect: false)
                                ],
                                descriptionText: "indexing_with_brackets_returns_ref_t_not_a_value",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "what_does_v_get_100_do_if_the_index_is_out_of_bounds",
                                answers: [
                                    Answer(id: UUID(), title: "panics", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_none", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_0", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_a_reference", isCorrect: false)
                                ],
                                descriptionText: "get_is_safe_and_always_returns_option_ref_t",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_happens_with_ref_v_100_if_there_are_fewer_elements",
                                answers: [
                                    Answer(id: UUID(), title: "returns_none", isCorrect: false),
                                    Answer(id: UUID(), title: "panics", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_0", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_time_error", isCorrect: false)
                                ],
                                descriptionText: "brackets_indexing_panics_on_out_of_bounds",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "can_you_have_ref_v_0_and_call_v_push_5_in_the_same_scope",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_push_doesnt_move_the_buffer", isCorrect: false),
                                    Answer(id: UUID(), title: "always_possible", isCorrect: false)
                                ],
                                descriptionText: "the_borrow_checker_forbids_this_since_push_may_reallocate_invalidating_the_reference",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "how_to_iterate_immutably_over_a_vector",
                                answers: [
                                    Answer(id: UUID(), title: "for_i_in_v", isCorrect: false),
                                    Answer(id: UUID(), title: "for_i_in_ref_v", isCorrect: true),
                                    Answer(id: UUID(), title: "for_i_in_v_iter_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "for_i_in_mut_v", isCorrect: false)
                                ],
                                descriptionText: "ref_v_yields_ref_t",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "how_to_modify_all_elements_in_a_vector",
                                answers: [
                                    Answer(id: UUID(), title: "for_i_in_v_star_i_plus_1", isCorrect: false),
                                    Answer(id: UUID(), title: "for_i_in_ref_mut_v_star_i_plus_1", isCorrect: true),
                                    Answer(id: UUID(), title: "for_mut_i_in_v_i_plus_1", isCorrect: false),
                                    Answer(id: UUID(), title: "v_map_x_x_plus_1", isCorrect: false)
                                ],
                                descriptionText: "ref_mut_v_yields_ref_mut_t_use_star_to_mutate_the_value",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "what_if_you_need_different_types_in_a_vec",
                                answers: [
                                    Answer(id: UUID(), title: "you_cant", isCorrect: false),
                                    Answer(id: UUID(), title: "use_an_enum", isCorrect: true),
                                    Answer(id: UUID(), title: "use_a_tuple", isCorrect: false),
                                    Answer(id: UUID(), title: "use_vec_dynamic", isCorrect: false)
                                ],
                                descriptionText: "a_vector_is_homogeneous_an_enum_unifies_variants_under_one_type",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "what_happens_to_vector_elements_when_it_goes_out_of_scope",
                                answers: [
                                    Answer(id: UUID(), title: "they_arent_freed", isCorrect: false),
                                    Answer(id: UUID(), title: "memory_leak", isCorrect: false),
                                    Answer(id: UUID(), title: "all_elements_are_dropped", isCorrect: true),
                                    Answer(id: UUID(), title: "only_the_first_element_is_dropped", isCorrect: false)
                                ],
                                descriptionText: "vec_frees_memory_and_calls_drop_for_each_element",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "what_is_string",
                                answers: [
                                    Answer(id: UUID(), title: "a_fixed_length_string", isCorrect: false),
                                    Answer(id: UUID(), title: "a_wrapper_around_vec_u8", isCorrect: true),
                                    Answer(id: UUID(), title: "a_utf_16_string", isCorrect: false),
                                    Answer(id: UUID(), title: "a_bag_of_chars", isCorrect: false)
                                ],
                                descriptionText: "string_is_utf_8_backed_by_vec_u8",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "how_to_create_an_empty_string",
                                answers: [
                                    Answer(id: UUID(), title: "string_empty", isCorrect: false),
                                    Answer(id: UUID(), title: "string_new", isCorrect: true),
                                    Answer(id: UUID(), title: "string_default", isCorrect: false),
                                    Answer(id: UUID(), title: "empty_string_literal", isCorrect: false)
                                ],
                                descriptionText: "string_new_creates_an_empty_string",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "how_to_create_a_string_from_a_literal",
                                answers: [
                                    Answer(id: UUID(), title: "hello_clone", isCorrect: false),
                                    Answer(id: UUID(), title: "hello_to_string", isCorrect: true),
                                    Answer(id: UUID(), title: "string_literal_hello", isCorrect: false),
                                    Answer(id: UUID(), title: "string_str_hello", isCorrect: false)
                                ],
                                descriptionText: "ref_str_has_to_string",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "difference_between_string_from_hi_and_hi_to_string",
                                answers: [
                                    Answer(id: UUID(), title: "different_types", isCorrect: false),
                                    Answer(id: UUID(), title: "no_difference", isCorrect: true),
                                    Answer(id: UUID(), title: "the_second_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "the_first_is_forbidden", isCorrect: false)
                                ],
                                descriptionText: "both_create_a_string_from_a_literal",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "what_does_push_str_do",
                                answers: [
                                    Answer(id: UUID(), title: "appends_a_char", isCorrect: false),
                                    Answer(id: UUID(), title: "appends_an_ref_str", isCorrect: true),
                                    Answer(id: UUID(), title: "deletes_the_string", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_a_copy", isCorrect: false)
                                ],
                                descriptionText: "push_str_takes_ref_str_and_appends_it",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "what_does_push_do",
                                answers: [
                                    Answer(id: UUID(), title: "appends_an_ref_str", isCorrect: false),
                                    Answer(id: UUID(), title: "appends_a_single_char", isCorrect: true),
                                    Answer(id: UUID(), title: "concatenates_strings", isCorrect: false),
                                    Answer(id: UUID(), title: "appends_an_array", isCorrect: false)
                                ],
                                descriptionText: "push_accepts_only_a_char",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "what_happens_with_let_s3_s1_plus_ref_s2",
                                answers: [
                                    Answer(id: UUID(), title: "both_remain_accessible", isCorrect: false),
                                    Answer(id: UUID(), title: "s1_is_moved", isCorrect: true),
                                    Answer(id: UUID(), title: "s2_is_moved", isCorrect: false),
                                    Answer(id: UUID(), title: "compile_error", isCorrect: false)
                                ],
                                descriptionText: "plus_is_fn_add_self_s_ref_str_string_so_s1_is_moved",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "why_is_format_better_than_plus_for_strings",
                                answers: [
                                    Answer(id: UUID(), title: "its_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "clearer_and_doesnt_move_arguments", isCorrect: true),
                                    Answer(id: UUID(), title: "produces_ref_str", isCorrect: false),
                                    Answer(id: UUID(), title: "for_printing_only", isCorrect: false)
                                ],
                                descriptionText: "format_takes_references_nothing_is_moved",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "why_cant_you_index_a_string_as_s_0",
                                answers: [
                                    Answer(id: UUID(), title: "arbitrary_language_choice", isCorrect: false),
                                    Answer(id: UUID(), title: "utf_8_has_variable_width", isCorrect: true),
                                    Answer(id: UUID(), title: "borrow_checker_issue", isCorrect: false),
                                    Answer(id: UUID(), title: "only_arrays_support_indexing", isCorrect: false)
                                ],
                                descriptionText: "one_character_can_span_multiple_bytes_byte_indexing_isnt_a_character",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "what_does_zdravstvuyte_len_return",
                                answers: [
                                    Answer(id: UUID(), title: "12", isCorrect: false),
                                    Answer(id: UUID(), title: "24", isCorrect: true),
                                    Answer(id: UUID(), title: "error", isCorrect: false),
                                    Answer(id: UUID(), title: "0", isCorrect: false)
                                ],
                                descriptionText: "len_returns_bytes_cyrillic_letters_here_are_2_bytes_each",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "how_to_get_a_slice_of_the_first_4_bytes_of_a_string",
                                answers: [
                                    Answer(id: UUID(), title: "ref_s_0_2", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_s_0_4", isCorrect: true),
                                    Answer(id: UUID(), title: "s_slice_4", isCorrect: false),
                                    Answer(id: UUID(), title: "s_bytes_0_4", isCorrect: false)
                                ],
                                descriptionText: "range_slicing_yields_ref_str_but_only_on_valid_char_boundaries",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "what_does_zd_chars_do",
                                answers: [
                                    Answer(id: UUID(), title: "bytes", isCorrect: false),
                                    Answer(id: UUID(), title: "unicode_scalar_chars", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_str_slices", isCorrect: false),
                                    Answer(id: UUID(), title: "error", isCorrect: false)
                                ],
                                descriptionText: "chars_iterates_unicode_scalar_values",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "what_does_zd_bytes_do",
                                answers: [
                                    Answer(id: UUID(), title: "characters", isCorrect: false),
                                    Answer(id: UUID(), title: "an_array_of_char", isCorrect: false),
                                    Answer(id: UUID(), title: "utf_8_bytes", isCorrect: true),
                                    Answer(id: UUID(), title: "graphemes", isCorrect: false)
                                ],
                                descriptionText: "bytes_yields_u8",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "what_doesnt_the_standard_library_provide_for_strings",
                                answers: [
                                    Answer(id: UUID(), title: "bytes", isCorrect: false),
                                    Answer(id: UUID(), title: "chars", isCorrect: false),
                                    Answer(id: UUID(), title: "grapheme_clusters", isCorrect: true),
                                    Answer(id: UUID(), title: "length", isCorrect: false)
                                ],
                                descriptionText: "graphemes_require_external_crates",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "how_to_create_a_hashmap",
                                answers: [
                                    Answer(id: UUID(), title: "let_m_hashmap_new", isCorrect: true),
                                    Answer(id: UUID(), title: "let_m_map_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "let_m_curly_braces", isCorrect: false),
                                    Answer(id: UUID(), title: "let_m_dictionary_macro", isCorrect: false)
                                ],
                                descriptionText: "hashmap_new_is_the_standard_way",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "where_is_hashmap_located",
                                answers: [
                                    Answer(id: UUID(), title: "std_hash", isCorrect: false),
                                    Answer(id: UUID(), title: "std_map", isCorrect: false),
                                    Answer(id: UUID(), title: "std_collections", isCorrect: true),
                                    Answer(id: UUID(), title: "std_core", isCorrect: false)
                                ],
                                descriptionText: "hashmap_lives_in_the_collections_module",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "how_to_get_a_value_from_a_hashmap",
                                answers: [
                                    Answer(id: UUID(), title: "map_key", isCorrect: false),
                                    Answer(id: UUID(), title: "map_get_key", isCorrect: true),
                                    Answer(id: UUID(), title: "map_value_key", isCorrect: false),
                                    Answer(id: UUID(), title: "map_find_key", isCorrect: false)
                                ],
                                descriptionText: "use_get_which_returns_option_ref_v",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "what_does_the_entry_method_do",
                                answers: [
                                    Answer(id: UUID(), title: "checks_key_existence", isCorrect: true),
                                    Answer(id: UUID(), title: "deletes_an_entry", isCorrect: false),
                                    Answer(id: UUID(), title: "overwrites_a_key", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_the_list_of_keys", isCorrect: false)
                                ],
                                descriptionText: "entry_returns_an_entry_on_which_you_can_call_or_insert",
                                descriptionLink: "common_collections_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "what_does_or_insert_50_do",
                                answers: [
                                    Answer(id: UUID(), title: "always_inserts_50", isCorrect: false),
                                    Answer(id: UUID(), title: "inserts_only_if_the_key_is_absent", isCorrect: true),
                                    Answer(id: UUID(), title: "deletes_the_key", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_an_option", isCorrect: false)
                                ],
                                descriptionText: "or_insert_inserts_when_missing_otherwise_it_returns_a_mutable_ref_to_the_existing_value",
                                descriptionLink: "common_collections_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "error_handling",
                        priority: 7,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "how_do_error_kinds_differ_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "compile_time_vs_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "light_vs_heavy", isCorrect: false),
                                    Answer(id: UUID(), title: "recoverable_vs_unrecoverable", isCorrect: true),
                                    Answer(id: UUID(), title: "syntactic_vs_logical", isCorrect: false)
                                ],
                                descriptionText: "recoverable_result_t_e_unrecoverable_panic",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "what_does_panic_do",
                                answers: [
                                    Answer(id: UUID(), title: "returns_err", isCorrect: false),
                                    Answer(id: UUID(), title: "prints_a_warning_and_continues", isCorrect: false),
                                    Answer(id: UUID(), title: "terminates_the_thread_with_stack_unwinding_by_default", isCorrect: true),
                                    Answer(id: UUID(), title: "silently_logs_an_error", isCorrect: false)
                                ],
                                descriptionText: "a_panic_stops_execution_default_behavior_is_unwinding",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "how_to_switch_panics_to_immediate_abort",
                                answers: [
                                    Answer(id: UUID(), title: "rust_panic_abort", isCorrect: false),
                                    Answer(id: UUID(), title: "in_cargo_toml_panic_abort_in_the_target_profile", isCorrect: true),
                                    Answer(id: UUID(), title: "compiler_flag_abort", isCorrect: false),
                                    Answer(id: UUID(), title: "function_std_panic_abort", isCorrect: false)
                                ],
                                descriptionText: "the_cargo_profile_sets_the_strategy",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_does_rust_backtrace_1_show",
                                answers: [
                                    Answer(id: UUID(), title: "error_type", isCorrect: false),
                                    Answer(id: UUID(), title: "the_call_stack_up_to_the_panic_site", isCorrect: true),
                                    Answer(id: UUID(), title: "memory_contents", isCorrect: false),
                                    Answer(id: UUID(), title: "rust_version", isCorrect: false)
                                ],
                                descriptionText: "enables_backtrace_output",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "which_type_is_used_for_recoverable_errors",
                                answers: [
                                    Answer(id: UUID(), title: "option_t", isCorrect: false),
                                    Answer(id: UUID(), title: "result_t_e", isCorrect: true),
                                    Answer(id: UUID(), title: "try_t", isCorrect: false),
                                    Answer(id: UUID(), title: "either_t_e", isCorrect: false)
                                ],
                                descriptionText: "result_encapsulates_success_error",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_does_file_open_a_txt_return",
                                answers: [
                                    Answer(id: UUID(), title: "option_file", isCorrect: false),
                                    Answer(id: UUID(), title: "result_file_io_error", isCorrect: true),
                                    Answer(id: UUID(), title: "result_ref_file_ref_io_error", isCorrect: false),
                                    Answer(id: UUID(), title: "file", isCorrect: false)
                                ],
                                descriptionText: "the_operation_can_fail",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "what_does_unwrap_on_a_result_do",
                                answers: [
                                    Answer(id: UUID(), title: "always_returns_t", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_t_or_panics", isCorrect: true),
                                    Answer(id: UUID(), title: "always_panics", isCorrect: false),
                                    Answer(id: UUID(), title: "converts_to_option", isCorrect: false)
                                ],
                                descriptionText: "shortcut_for_ok_or_panic",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "how_does_expect_differ_from_unwrap",
                                answers: [
                                    Answer(id: UUID(), title: "returns_option", isCorrect: false),
                                    Answer(id: UUID(), title: "doesnt_panic", isCorrect: false),
                                    Answer(id: UUID(), title: "lets_you_set_a_custom_panic_message", isCorrect: true),
                                    Answer(id: UUID(), title: "is_2x_slower", isCorrect: false)
                                ],
                                descriptionText: "you_provide_your_own_message",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "how_to_react_differently_to_io_error_kinds",
                                answers: [
                                    Answer(id: UUID(), title: "if_error_equals_notfound", isCorrect: false),
                                    Answer(id: UUID(), title: "match_error_kind", isCorrect: true),
                                    Answer(id: UUID(), title: "error_code", isCorrect: false),
                                    Answer(id: UUID(), title: "you_cant", isCorrect: false)
                                ],
                                descriptionText: "errorkind_indicates_the_class_of_error",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "what_does_unwrap_or_else_e_do",
                                answers: [
                                    Answer(id: UUID(), title: "always_uses_a_default_value", isCorrect: false),
                                    Answer(id: UUID(), title: "handles_ok", isCorrect: false),
                                    Answer(id: UUID(), title: "calls_the_closure_only_on_err", isCorrect: true),
                                    Answer(id: UUID(), title: "never_called", isCorrect: false)
                                ],
                                descriptionText: "lazily_creates_a_value_on_error",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "what_is_error_propagation",
                                answers: [
                                    Answer(id: UUID(), title: "logging_and_continuing", isCorrect: false),
                                    Answer(id: UUID(), title: "converting_to_panic", isCorrect: false),
                                    Answer(id: UUID(), title: "returning_the_error_to_the_caller", isCorrect: true),
                                    Answer(id: UUID(), title: "retrying", isCorrect: false)
                                ],
                                descriptionText: "let_the_caller_decide",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "what_does_the_question_mark_operator_do",
                                answers: [
                                    Answer(id: UUID(), title: "converts_result_to_option", isCorrect: false),
                                    Answer(id: UUID(), title: "if_ok_unwrap_if_err_return_from_the_function", isCorrect: true),
                                    Answer(id: UUID(), title: "catches_panics", isCorrect: false),
                                    Answer(id: UUID(), title: "hides_the_error", isCorrect: false)
                                ],
                                descriptionText: "sugar_for_match_on_result",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "where_can_you_use_question_mark",
                                answers: [
                                    Answer(id: UUID(), title: "in_any_function", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_main", isCorrect: false),
                                    Answer(id: UUID(), title: "in_functions_whose_return_type_is_compatible_result_option", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_async", isCorrect: false)
                                ],
                                descriptionText: "early_return_must_match_the_functions_return_type",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "what_does_question_mark_do_on_option_t",
                                answers: [
                                    Answer(id: UUID(), title: "converts_to_result", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_none_on_none_otherwise_unwraps_some", isCorrect: true),
                                    Answer(id: UUID(), title: "panics_on_none", isCorrect: false),
                                    Answer(id: UUID(), title: "ignores_none", isCorrect: false)
                                ],
                                descriptionText: "same_idea_as_result_but_for_option",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "can_you_use_question_mark_on_a_result_inside_a_function_returning_option",
                                answers: [
                                    Answer(id: UUID(), title: "yes_automatically", isCorrect: false),
                                    Answer(id: UUID(), title: "no_you_need_explicit_conversion_ok_ok_or", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_only_on_nightly", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_from_is_implemented", isCorrect: false)
                                ],
                                descriptionText: "types_are_incompatible_without_conversion",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "what_does_from_do_in_the_context_of_question_mark",
                                answers: [
                                    Answer(id: UUID(), title: "writes_to_logs", isCorrect: false),
                                    Answer(id: UUID(), title: "converts_ok_into_err", isCorrect: false),
                                    Answer(id: UUID(), title: "converts_the_error_type_into_the_functions_error_type", isCorrect: true),
                                    Answer(id: UUID(), title: "suppresses_the_error", isCorrect: false)
                                ],
                                descriptionText: "question_mark_uses_from_from_err_to_coerce_errors",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "can_you_use_question_mark_in_main",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_main_returns_result_e", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_box_dyn_error", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_io_result", isCorrect: false)
                                ],
                                descriptionText: "main_can_return_result_then_question_mark_is_allowed",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "what_does_box_dyn_error_mean_in_main_result_box_dyn_error",
                                answers: [
                                    Answer(id: UUID(), title: "forbids_question_mark", isCorrect: false),
                                    Answer(id: UUID(), title: "allows_any_error_type", isCorrect: true),
                                    Answer(id: UUID(), title: "hides_the_stack", isCorrect: false),
                                    Answer(id: UUID(), title: "panics_on_any_error", isCorrect: false)
                                ],
                                descriptionText: "trait_object_for_any_error",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "which_is_preferable_in_production_unwrap_or_expect",
                                answers: [
                                    Answer(id: UUID(), title: "unwrap", isCorrect: false),
                                    Answer(id: UUID(), title: "expect_with_a_clear_message", isCorrect: true),
                                    Answer(id: UUID(), title: "neither", isCorrect: false),
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false)
                                ],
                                descriptionText: "gives_context_on_failure",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "when_is_panicking_appropriate",
                                answers: [
                                    Answer(id: UUID(), title: "always_for_any_error", isCorrect: false),
                                    Answer(id: UUID(), title: "in_examples_prototypes_tests_on_invariant_violations_in_unsafe_states", isCorrect: true),
                                    Answer(id: UUID(), title: "never", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_release", isCorrect: false)
                                ],
                                descriptionText: "panic_is_for_truly_impossible_dangerous_situations",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "what_is_a_bad_state",
                                answers: [
                                    Answer(id: UUID(), title: "any_input_error", isCorrect: false),
                                    Answer(id: UUID(), title: "contract_invariant_violation_dangerous_inconsistent_values", isCorrect: true),
                                    Answer(id: UUID(), title: "a_zero_value", isCorrect: false),
                                    Answer(id: UUID(), title: "an_empty_file", isCorrect: false)
                                ],
                                descriptionText: "unsafe_to_continue_afterwards",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "for_expected_failures_eg_api_rate_limit_whats_better",
                                answers: [
                                    Answer(id: UUID(), title: "panic", isCorrect: false),
                                    Answer(id: UUID(), title: "return_result", isCorrect: true),
                                    Answer(id: UUID(), title: "ignore_it", isCorrect: false),
                                    Answer(id: UUID(), title: "unwrap", isCorrect: false)
                                ],
                                descriptionText: "let_the_caller_choose_a_recovery_strategy",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "how_to_bake_in_value_validation_into_types",
                                answers: [
                                    Answer(id: UUID(), title: "check_with_if_in_every_function", isCorrect: false),
                                    Answer(id: UUID(), title: "create_a_new_type_and_validate_in_its_constructor", isCorrect: true),
                                    Answer(id: UUID(), title: "use_a_global_variable", isCorrect: false),
                                    Answer(id: UUID(), title: "rely_on_comments", isCorrect: false)
                                ],
                                descriptionText: "encapsulation_enforces_correctness_at_the_type_level",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "why_make_fields_of_a_validating_type_private",
                                answers: [
                                    Answer(id: UUID(), title: "for_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "to_prevent_bypassing_constructor_checks", isCorrect: true),
                                    Answer(id: UUID(), title: "to_make_it_compile", isCorrect: false),
                                    Answer(id: UUID(), title: "for_automatic_debug", isCorrect: false)
                                ],
                                descriptionText: "otherwise_invalid_values_could_be_assigned_directly",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "what_does_fs_read_to_string_path_return",
                                answers: [
                                    Answer(id: UUID(), title: "string_or_panic", isCorrect: false),
                                    Answer(id: UUID(), title: "result_string_io_error", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_str", isCorrect: false),
                                    Answer(id: UUID(), title: "option_string", isCorrect: false)
                                ],
                                descriptionText: "convenience_function_with_its_own_error_type",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "how_does_match_on_result_compare_to_question_mark",
                                answers: [
                                    Answer(id: UUID(), title: "match_is_shorter", isCorrect: false),
                                    Answer(id: UUID(), title: "question_mark_is_shorter_and_does_the_same_unwrap_ok_return_err", isCorrect: true),
                                    Answer(id: UUID(), title: "question_mark_is_slower", isCorrect: false),
                                    Answer(id: UUID(), title: "match_cant_be_used", isCorrect: false)
                                ],
                                descriptionText: "question_mark_is_syntactic_sugar",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "what_happens_with_v_99_if_v_is_shorter",
                                answers: [
                                    Answer(id: UUID(), title: "returns_none", isCorrect: false),
                                    Answer(id: UUID(), title: "panics_due_to_out_of_bounds", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_err", isCorrect: false),
                                    Answer(id: UUID(), title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "bounds_checked_indexing_panic",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "what_does_a_vectors_get_method_return",
                                answers: [
                                    Answer(id: UUID(), title: "result_ref_t_outofbounds", isCorrect: false),
                                    Answer(id: UUID(), title: "option_ref_t", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_t", isCorrect: false),
                                    Answer(id: UUID(), title: "option_t", isCorrect: false)
                                ],
                                descriptionText: "safe_access_without_panic",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "shorter_way_to_open_a_file_and_read_it_into_a_string_using_question_mark",
                                answers: [
                                    Answer(id: UUID(), title: "file_open_question_mark_read_to_string_question_mark_with_a_buffer", isCorrect: false),
                                    Answer(id: UUID(), title: "fs_read_to_string_hello_txt", isCorrect: true),
                                    Answer(id: UUID(), title: "include_str", isCorrect: false),
                                    Answer(id: UUID(), title: "std_read_all", isCorrect: false)
                                ],
                                descriptionText: "theres_a_ready_made_std_function",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "what_does_unwinding_mean_during_a_panic",
                                answers: [
                                    Answer(id: UUID(), title: "the_gc_cleans_the_heap", isCorrect: false),
                                    Answer(id: UUID(), title: "the_stack_is_unwound_and_destructors_drop_are_called", isCorrect: true),
                                    Answer(id: UUID(), title: "threads_migrate", isCorrect: false),
                                    Answer(id: UUID(), title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "proper_cleanup_unless_abort_is_chosen",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "why_choose_panic_abort_sometimes",
                                answers: [
                                    Answer(id: UUID(), title: "smaller_binary_simpler_behavior_in_production", isCorrect: true),
                                    Answer(id: UUID(), title: "to_catch_errors", isCorrect: false),
                                    Answer(id: UUID(), title: "for_debugging", isCorrect: false),
                                    Answer(id: UUID(), title: "for_faster_compilation", isCorrect: false)
                                ],
                                descriptionText: "no_unwinding_code_smaller_size",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_use_question_mark_in_a_function_returning_unit",
                                answers: [
                                    Answer(id: UUID(), title: "it_compiles", isCorrect: false),
                                    Answer(id: UUID(), title: "it_doesnt_compile_return_type_mismatch", isCorrect: true),
                                    Answer(id: UUID(), title: "automatically_wraps_in_result", isCorrect: false),
                                    Answer(id: UUID(), title: "converts_to_a_panic", isCorrect: false)
                                ],
                                descriptionText: "question_mark_returns_early_with_err_the_function_must_return_a_compatible_type",
                                descriptionLink: "error_handling_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "which_code_is_valid_with_question_mark_in_main",
                                answers: [
                                    Answer(id: UUID(), title: "fn_main_file_open_x_question_mark", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_main_result_box_dyn_error_file_open_x_question_mark_ok", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_main_option_file_open_x_question_mark_some", isCorrect: false),
                                    Answer(id: UUID(), title: "none", isCorrect: false)
                                ],
                                descriptionText: "main_must_return_result_for_question_mark_on_result_to_be_valid",
                                descriptionLink: "error_handling_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "generic_types_traits_and_lifetimes",
                        priority: 8,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_are_generics_used_for_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "to_reduce_binary_size", isCorrect: false),
                                    Answer(id: UUID(), title: "to_avoid_code_duplication", isCorrect: true),
                                    Answer(id: UUID(), title: "to_speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(), title: "to_replace_macros", isCorrect: false)
                                ],
                                descriptionText: "generics_allow_writing_abstract_code_for_different_types_without_copying_logic",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "how_is_a_type_parameter_denoted_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "square_brackets_t", isCorrect: false),
                                    Answer(id: UUID(), title: "curly_braces_t", isCorrect: false),
                                    Answer(id: UUID(), title: "angle_brackets_t", isCorrect: true),
                                    Answer(id: UUID(), title: "parentheses_t", isCorrect: false)
                                ],
                                descriptionText: "generics_are_written_in_angle_brackets",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "what_does_a_function_signature_with_generics_look_like",
                                answers: [
                                    Answer(id: UUID(), title: "fn_foo_t_i32_t", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_t_x_t_t", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_foo_x_generic_t", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_t_t_x_t", isCorrect: false)
                                ],
                                descriptionText: "generics_are_declared_after_the_function_name_in_angle_brackets",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_use_the_greater_than_operator_in_a_generic_function_without_constraints",
                                answers: [
                                    Answer(id: UUID(), title: "always_works", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(), title: "partialord_is_automatically_applied", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_panic", isCorrect: false)
                                ],
                                descriptionText: "the_greater_than_comparison_requires_the_partialord_trait",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "how_do_you_constrain_a_generic_type_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "t", isCorrect: false),
                                    Answer(id: UUID(), title: "where_t_partialord", isCorrect: true),
                                    Answer(id: UUID(), title: "bound_t_partialord", isCorrect: false),
                                    Answer(id: UUID(), title: "impl_partialord_for_t", isCorrect: false)
                                ],
                                descriptionText: "constraints_bounds_are_written_as_t_trait",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_is_a_trait_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "a_data_type", isCorrect: false),
                                    Answer(id: UUID(), title: "an_interface", isCorrect: true),
                                    Answer(id: UUID(), title: "a_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "an_attribute", isCorrect: false)
                                ],
                                descriptionText: "trait_describes_common_behavior_like_interfaces_in_other_languages",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_trait",
                                answers: [
                                    Answer(id: UUID(), title: "interface_summary", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_summary", isCorrect: true),
                                    Answer(id: UUID(), title: "class_summary", isCorrect: false),
                                    Answer(id: UUID(), title: "impl_summary", isCorrect: false)
                                ],
                                descriptionText: "the_trait_keyword_is_used",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "how_do_you_implement_a_trait_for_a_struct",
                                answers: [
                                    Answer(id: UUID(), title: "impl_struct_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "impl_trait_for_struct", isCorrect: true),
                                    Answer(id: UUID(), title: "trait_struct_impl", isCorrect: false),
                                    Answer(id: UUID(), title: "class_struct_trait", isCorrect: false)
                                ],
                                descriptionText: "syntax_is_impl_trait_for_type",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "can_you_implement_an_external_trait_for_an_external_type",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_allow_external_attribute", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_main", isCorrect: false)
                                ],
                                descriptionText: "prohibited_by_the_orphan_rule",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "what_is_the_orphan_rule",
                                answers: [
                                    Answer(id: UUID(), title: "traits_cannot_be_inherited", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_implement_an_external_trait_for_an_external_type", isCorrect: true),
                                    Answer(id: UUID(), title: "prohibits_using_static", isCorrect: false),
                                    Answer(id: UUID(), title: "requires_private_fields", isCorrect: false)
                                ],
                                descriptionText: "protects_against_implementation_conflicts",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "how_do_you_define_a_default_method_in_a_trait",
                                answers: [
                                    Answer(id: UUID(), title: "fn_foo", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_body", isCorrect: true),
                                    Answer(id: UUID(), title: "default_fn_foo", isCorrect: false),
                                    Answer(id: UUID(), title: "impl_fn_foo", isCorrect: false)
                                ],
                                descriptionText: "implementation_in_the_trait_serves_as_the_default",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "can_you_override_a_default_method",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_override_attribute", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_generics", isCorrect: false)
                                ],
                                descriptionText: "in_impl_you_can_override_a_method_with_any_implementation",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "how_do_you_use_a_trait_as_a_function_parameter",
                                answers: [
                                    Answer(id: UUID(), title: "fn_foo_t_x_t_where_t_summary", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_x_impl_summary", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_foo_x_dyn_summary", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_t_impl_summary_x_t", isCorrect: false)
                                ],
                                descriptionText: "impl_trait_is_the_short_syntax",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "whats_the_difference_between_impl_trait_and_trait_bound",
                                answers: [
                                    Answer(id: UUID(), title: "they_are_different_things", isCorrect: false),
                                    Answer(id: UUID(), title: "impl_trait_is_syntactic_sugar_for_trait_bound", isCorrect: true),
                                    Answer(id: UUID(), title: "impl_trait_works_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_bound_is_forbidden", isCorrect: false)
                                ],
                                descriptionText: "both_express_the_same_thing",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "how_do_you_combine_multiple_trait_bounds",
                                answers: [
                                    Answer(id: UUID(), title: "t_trait1_trait2", isCorrect: false),
                                    Answer(id: UUID(), title: "t_trait1_plus_trait2", isCorrect: true),
                                    Answer(id: UUID(), title: "t_trait1_trait2_brackets", isCorrect: false),
                                    Answer(id: UUID(), title: "t_trait1_ampersand_trait2", isCorrect: false)
                                ],
                                descriptionText: "multiple_traits_are_specified_with_plus",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "where_is_it_more_convenient_to_write_complex_bounds",
                                answers: [
                                    Answer(id: UUID(), title: "in_the_signature", isCorrect: false),
                                    Answer(id: UUID(), title: "in_where", isCorrect: true),
                                    Answer(id: UUID(), title: "in_impl_only", isCorrect: false),
                                    Answer(id: UUID(), title: "in_comments", isCorrect: false)
                                ],
                                descriptionText: "where_makes_the_signature_more_readable",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "how_do_you_return_a_type_that_implements_a_trait",
                                answers: [
                                    Answer(id: UUID(), title: "fn_foo_impl_trait", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_foo_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_t_trait_t", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_dyn_trait", isCorrect: false)
                                ],
                                descriptionText: "impl_trait_in_return_position",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "can_you_return_different_types_through_impl_trait",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_dynamic_attribute", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_unsafe", isCorrect: false)
                                ],
                                descriptionText: "only_one_concrete_type_is_allowed",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "what_is_a_blanket_implementation",
                                answers: [
                                    Answer(id: UUID(), title: "implementing_a_trait_for_all_types_with_a_constraint", isCorrect: true),
                                    Answer(id: UUID(), title: "automatic_code_generation", isCorrect: false),
                                    Answer(id: UUID(), title: "a_macro_in_std", isCorrect: false),
                                    Answer(id: UUID(), title: "duplication_prohibition", isCorrect: false)
                                ],
                                descriptionText: "example_impl_t_display_tostring_for_t",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "what_does_monomorphization_do",
                                answers: [
                                    Answer(id: UUID(), title: "generates_code_for_each_type", isCorrect: true),
                                    Answer(id: UUID(), title: "removes_generics", isCorrect: false),
                                    Answer(id: UUID(), title: "optimizes_code_at_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "turns_into_trait_object", isCorrect: false)
                                ],
                                descriptionText: "generics_are_turned_into_concrete_types_at_compile_time",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "is_there_runtime_overhead_with_generics",
                                answers: [
                                    Answer(id: UUID(), title: "yes_due_to_virtual_calls", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "sometimes", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_debug", isCorrect: false)
                                ],
                                descriptionText: "thanks_to_monomorphization_theres_no_overhead",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "what_is_a_lifetime",
                                answers: [
                                    Answer(id: UUID(), title: "variable_lifetime", isCorrect: false),
                                    Answer(id: UUID(), title: "reference_validity_duration", isCorrect: true),
                                    Answer(id: UUID(), title: "variable_type", isCorrect: false),
                                    Answer(id: UUID(), title: "program_execution_time", isCorrect: false)
                                ],
                                descriptionText: "lifetimes_describe_how_long_a_reference_lives",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "what_are_lifetime_annotations_for",
                                answers: [
                                    Answer(id: UUID(), title: "speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(), title: "help_the_borrow_checker_understand_relationships_between_references", isCorrect: true),
                                    Answer(id: UUID(), title: "increase_object_lifetimes", isCorrect: false),
                                    Answer(id: UUID(), title: "give_access_to_static", isCorrect: false)
                                ],
                                descriptionText: "lifetimes_connect_references_and_are_checked_at_compile_time",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "how_are_lifetime_parameters_denoted",
                                answers: [
                                    Answer(id: UUID(), title: "caret_a", isCorrect: false),
                                    Answer(id: UUID(), title: "apostrophe_a", isCorrect: true),
                                    Answer(id: UUID(), title: "ampersand_a", isCorrect: false),
                                    Answer(id: UUID(), title: "hash_a", isCorrect: false)
                                ],
                                descriptionText: "lifetimes_always_start_with_apostrophe",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "where_are_lifetime_annotations_written_in_functions",
                                answers: [
                                    Answer(id: UUID(), title: "inside_the_body", isCorrect: false),
                                    Answer(id: UUID(), title: "in_the_signature", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_impl", isCorrect: false),
                                    Answer(id: UUID(), title: "in_comments", isCorrect: false)
                                ],
                                descriptionText: "lifetimes_are_part_of_the_function_contract",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_return_a_reference_to_a_local_variable",
                                answers: [
                                    Answer(id: UUID(), title: "always_works", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(), title: "panic_at_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "undefined_behavior", isCorrect: false)
                                ],
                                descriptionText: "the_compiler_prohibits_dangling_references",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "what_does_the_borrow_checker_do",
                                answers: [
                                    Answer(id: UUID(), title: "checks_type_sizes", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_that_references_live_long_enough", isCorrect: true),
                                    Answer(id: UUID(), title: "optimizes_the_heap", isCorrect: false),
                                    Answer(id: UUID(), title: "removes_duplicates", isCorrect: false)
                                ],
                                descriptionText: "guarantees_no_dangling_references",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "what_does_the_static_lifetime_mean",
                                answers: [
                                    Answer(id: UUID(), title: "reference_lives_until_the_end_of_the_program", isCorrect: true),
                                    Answer(id: UUID(), title: "global_variable", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_const", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_string", isCorrect: false)
                                ],
                                descriptionText: "string_literals_have_static",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "what_is_lifetime_elision",
                                answers: [
                                    Answer(id: UUID(), title: "garbage_collector", isCorrect: false),
                                    Answer(id: UUID(), title: "rules_that_allow_omitting_lifetimes_in_simple_cases", isCorrect: true),
                                    Answer(id: UUID(), title: "turning_lifetimes_into_static", isCorrect: false),
                                    Answer(id: UUID(), title: "panic_on_mismatch", isCorrect: false)
                                ],
                                descriptionText: "the_compiler_applies_three_rules_for_lifetime_inference",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "which_function_falls_under_elision_rules",
                                answers: [
                                    Answer(id: UUID(), title: "fn_foo_x_ref_str_ref_str", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_foo_x_ref_str_y_ref_str_ref_str", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_x_ref_str_y_ref_str_ref_string", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_foo_a_x_ref_a_str_y_ref_a_str_ref_a_str", isCorrect: false)
                                ],
                                descriptionText: "one_input_value_its_lifetime_is_used_as_output",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "why_are_lifetimes_often_not_written_in_methods",
                                answers: [
                                    Answer(id: UUID(), title: "static_is_automatically_substituted", isCorrect: false),
                                    Answer(id: UUID(), title: "the_3rd_elision_rule_works_with_ref_self", isCorrect: true),
                                    Answer(id: UUID(), title: "because_impl_hides_them", isCorrect: false),
                                    Answer(id: UUID(), title: "the_compiler_ignores_them", isCorrect: false)
                                ],
                                descriptionText: "if_theres_ref_self_the_returned_reference_gets_its_lifetime",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "can_you_store_a_reference_in_a_struct",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_with_lifetime_annotation", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_always", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_enum", isCorrect: false)
                                ],
                                descriptionText: "a_struct_with_ref_t_requires_lifetime_a",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "what_happens_if_a_struct_lifetime_parameter_is_not_specified",
                                answers: [
                                    Answer(id: UUID(), title: "always_works", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(), title: "panic", isCorrect: false),
                                    Answer(id: UUID(), title: "will_be_static", isCorrect: false)
                                ],
                                descriptionText: "references_always_require_lifetimes",
                                descriptionLink: "generic_types_traits_and_lifetimes_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "writing_automated_tests",
                        priority: 9,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_does_the_test_attribute_before_a_function_do",
                                answers: [
                                    Answer(id: UUID(), title: "makes_the_function_public", isCorrect: false),
                                    Answer(id: UUID(), title: "marks_the_function_as_a_test", isCorrect: true),
                                    Answer(id: UUID(), title: "prohibits_compilation", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_the_function_private", isCorrect: false)
                                ],
                                descriptionText: "test_tells_the_test_runner_that_this_is_a_test",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "which_command_runs_tests_in_a_rust_project",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_run", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_build", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test", isCorrect: true),
                                    Answer(id: UUID(), title: "rustc_test_rs", isCorrect: false)
                                ],
                                descriptionText: "tests_are_run_with_cargo_test_which_compiles_and_executes_them",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_call_panic_in_a_test",
                                answers: [
                                    Answer(id: UUID(), title: "the_test_completes_successfully", isCorrect: false),
                                    Answer(id: UUID(), title: "the_test_fails", isCorrect: true),
                                    Answer(id: UUID(), title: "the_compiler_ignores_it", isCorrect: false),
                                    Answer(id: UUID(), title: "panic_is_hidden", isCorrect: false)
                                ],
                                descriptionText: "a_test_is_considered_failed_if_it_panics",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_does_the_assert_macro_do",
                                answers: [
                                    Answer(id: UUID(), title: "checks_equality_of_two_values", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_a_condition_for_true", isCorrect: true),
                                    Answer(id: UUID(), title: "calls_drop_on_a_variable", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_a_log_in_stdout", isCorrect: false)
                                ],
                                descriptionText: "assert_cond_checks_a_boolean_condition_on_false_panic",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "how_does_assert_eq_differ_from_assert",
                                answers: [
                                    Answer(id: UUID(), title: "works_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "shows_left_right_values_on_error", isCorrect: true),
                                    Answer(id: UUID(), title: "uses_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "only_works_with_numbers", isCorrect: false)
                                ],
                                descriptionText: "assert_eq_prints_both_values_on_mismatch",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_does_assert_ne_do",
                                answers: [
                                    Answer(id: UUID(), title: "checks_for_equality", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_for_inequality", isCorrect: true),
                                    Answer(id: UUID(), title: "checks_for_null", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_for_drop", isCorrect: false)
                                ],
                                descriptionText: "assert_ne_passes_if_values_are_different",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "which_traits_must_types_implement_to_use_in_assert_eq",
                                answers: [
                                    Answer(id: UUID(), title: "clone_and_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "partialeq_and_debug", isCorrect: true),
                                    Answer(id: UUID(), title: "sized_and_send", isCorrect: false),
                                    Answer(id: UUID(), title: "drop_and_default", isCorrect: false)
                                ],
                                descriptionText: "comparison_requires_partialeq_printing_requires_debug",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "what_does_the_should_panic_attribute_do",
                                answers: [
                                    Answer(id: UUID(), title: "prevents_test_failure", isCorrect: false),
                                    Answer(id: UUID(), title: "expects_the_test_to_panic", isCorrect: true),
                                    Answer(id: UUID(), title: "sets_the_test_to_ignored", isCorrect: false),
                                    Answer(id: UUID(), title: "disables_borrow_checker", isCorrect: false)
                                ],
                                descriptionText: "the_test_passes_only_if_a_panic_occurred",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "what_is_the_expected_parameter_used_for_in_should_panic_expected",
                                answers: [
                                    Answer(id: UUID(), title: "to_specify_the_panic_type", isCorrect: false),
                                    Answer(id: UUID(), title: "to_check_that_panic_contains_a_substring", isCorrect: true),
                                    Answer(id: UUID(), title: "to_specify_the_return_value", isCorrect: false),
                                    Answer(id: UUID(), title: "to_choose_optimization_level", isCorrect: false)
                                ],
                                descriptionText: "helps_verify_that_panic_occurred_for_the_right_reason",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "can_you_use_should_panic_with_tests_returning_result_t_e",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_nightly", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_err", isCorrect: false)
                                ],
                                descriptionText: "tests_with_result_cannot_be_combined_with_should_panic",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "what_does_writing_tests_with_result_unit_e_allow",
                                answers: [
                                    Answer(id: UUID(), title: "using_question_mark_inside_the_test", isCorrect: true),
                                    Answer(id: UUID(), title: "disabling_asserts", isCorrect: false),
                                    Answer(id: UUID(), title: "turning_errors_into_warnings", isCorrect: false),
                                    Answer(id: UUID(), title: "skipping_the_test", isCorrect: false)
                                ],
                                descriptionText: "question_mark_is_only_available_when_returning_result",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "how_are_tests_run_by_default_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "sequentially", isCorrect: false),
                                    Answer(id: UUID(), title: "in_parallel", isCorrect: true),
                                    Answer(id: UUID(), title: "only_one", isCorrect: false),
                                    Answer(id: UUID(), title: "through_separate_binary_for_each_test", isCorrect: false)
                                ],
                                descriptionText: "tests_run_in_threads_by_default",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "how_do_you_limit_the_number_of_threads_for_tests",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_test_limit_n", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test_test_threads_n", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_run_threads_n", isCorrect: false),
                                    Answer(id: UUID(), title: "export_test_threads_n", isCorrect: false)
                                ],
                                descriptionText: "the_test_threads_flag_sets_the_number",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "why_cant_tests_sometimes_be_run_in_parallel",
                                answers: [
                                    Answer(id: UUID(), title: "because_its_slower", isCorrect: false),
                                    Answer(id: UUID(), title: "due_to_shared_state", isCorrect: true),
                                    Answer(id: UUID(), title: "the_compiler_prohibits_it", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_doesnt_know_how", isCorrect: false)
                                ],
                                descriptionText: "parallel_tests_can_conflict_through_shared_resources",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "what_does_the_show_output_flag_do_when_running_cargo_test",
                                answers: [
                                    Answer(id: UUID(), title: "shows_output_only_for_failed_tests", isCorrect: false),
                                    Answer(id: UUID(), title: "shows_println_output_even_for_passed_tests", isCorrect: true),
                                    Answer(id: UUID(), title: "shows_only_the_list_of_tests", isCorrect: false),
                                    Answer(id: UUID(), title: "disables_stdout", isCorrect: false)
                                ],
                                descriptionText: "by_default_println_is_hidden_show_output_always_displays_it",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "how_do_you_run_only_a_test_named_foo_test",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_run_foo_test", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test_foo_test", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_test_name_foo_test", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test_only_foo_test", isCorrect: false)
                                ],
                                descriptionText: "filtering_by_name_works_through_the_cargo_test_argument",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_pass_cargo_test_add",
                                answers: [
                                    Answer(id: UUID(), title: "only_one_test_runs", isCorrect: false),
                                    Answer(id: UUID(), title: "all_tests_with_add_in_the_name_run", isCorrect: true),
                                    Answer(id: UUID(), title: "all_tests_are_ignored", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error", isCorrect: false)
                                ],
                                descriptionText: "substring_filters_the_test_set",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "what_is_the_ignore_attribute_used_for_in_a_test",
                                answers: [
                                    Answer(id: UUID(), title: "completely_removes_the_test", isCorrect: false),
                                    Answer(id: UUID(), title: "skips_the_test_during_normal_run", isCorrect: true),
                                    Answer(id: UUID(), title: "makes_the_test_private", isCorrect: false),
                                    Answer(id: UUID(), title: "places_the_test_first_in_the_list", isCorrect: false)
                                ],
                                descriptionText: "ignore_excludes_the_test_from_default_run",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "how_do_you_run_only_ignored_tests",
                                answers: [
                                    Answer(id: UUID(), title: "cargo_test_ignore", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test_ignored", isCorrect: true),
                                    Answer(id: UUID(), title: "cargo_test_include_ignored", isCorrect: false),
                                    Answer(id: UUID(), title: "cargo_test_ignored_only", isCorrect: false)
                                ],
                                descriptionText: "the_ignored_flag_runs_only_tests_with_the_ignore_attribute",
                                descriptionLink: "writing_automated_tests_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "whats_the_difference_between_unit_and_integration_tests",
                                answers: [
                                    Answer(id: UUID(), title: "unit_tests_are_always_public_integration_are_private", isCorrect: false),
                                    Answer(id: UUID(), title: "unit_tests_are_written_inside_src_integration_in_tests_folder", isCorrect: true),
                                    Answer(id: UUID(), title: "unit_tests_require_cargo_toml_integration_dont", isCorrect: false),
                                    Answer(id: UUID(), title: "unit_tests_only_run_with_nightly", isCorrect: false)
                                ],
                                descriptionText: "unit_tests_live_in_the_same_file_integration_in_separate_tests_directory",
                                descriptionLink: "writing_automated_tests_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "functional_language_features_iterators_and_closures",
                        priority: 10,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "how_does_a_closure_differ_from_a_regular_function",
                                answers: [
                                    Answer(id: UUID(), title: "has_no_parameters", isCorrect: false),
                                    Answer(id: UUID(), title: "can_capture_the_environment", isCorrect: true),
                                    Answer(id: UUID(), title: "only_works_in_main", isCorrect: false),
                                    Answer(id: UUID(), title: "always_asynchronous", isCorrect: false)
                                ],
                                descriptionText: "functions_cannot_capture_values_from_their_scope_closures_can",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_closure_without_parameters",
                                answers: [
                                    Answer(id: UUID(), title: "fn_empty_braces", isCorrect: false),
                                    Answer(id: UUID(), title: "vertical_bars_braces", isCorrect: true),
                                    Answer(id: UUID(), title: "square_brackets_braces", isCorrect: false),
                                    Answer(id: UUID(), title: "only_braces", isCorrect: false)
                                ],
                                descriptionText: "closure_syntax_uses_vertical_bars",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "what_does_the_unwrap_or_else_method_do_for_option",
                                answers: [
                                    Answer(id: UUID(), title: "returns_the_value_or_panics", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_the_value_or_calls_a_closure", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_only_none", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_a_reference", isCorrect: false)
                                ],
                                descriptionText: "unwrap_or_else_accepts_a_closure_that_executes_on_none",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "whats_the_difference_between_unwrap_or_and_unwrap_or_else",
                                answers: [
                                    Answer(id: UUID(), title: "first_accepts_a_value_second_accepts_a_closure", isCorrect: true),
                                    Answer(id: UUID(), title: "first_works_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "second_doesnt_work_with_some", isCorrect: false),
                                    Answer(id: UUID(), title: "first_always_panics", isCorrect: false)
                                ],
                                descriptionText: "unwrap_or_else_lazily_computes_the_value_only_if_none",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "how_does_a_closure_capture_variables_by_default",
                                answers: [
                                    Answer(id: UUID(), title: "always_by_value", isCorrect: false),
                                    Answer(id: UUID(), title: "decides_itself_by_reference_by_mut_or_by_move", isCorrect: true),
                                    Answer(id: UUID(), title: "always_by_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_capture", isCorrect: false)
                                ],
                                descriptionText: "rust_chooses_the_capture_strategy_based_on_the_closure_body",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_does_the_move_keyword_do_for_a_closure",
                                answers: [
                                    Answer(id: UUID(), title: "prohibits_capture", isCorrect: false),
                                    Answer(id: UUID(), title: "captures_variables_by_value", isCorrect: true),
                                    Answer(id: UUID(), title: "makes_the_closure_fnmut", isCorrect: false),
                                    Answer(id: UUID(), title: "optimizes_speed", isCorrect: false)
                                ],
                                descriptionText: "move_forces_ownership_transfer_into_the_closure",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "why_do_you_need_to_use_move_in_a_closure_for_a_new_thread",
                                answers: [
                                    Answer(id: UUID(), title: "thread_cannot_reference_parent_data", isCorrect: true),
                                    Answer(id: UUID(), title: "its_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "without_it_panic", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_fnonce", isCorrect: false)
                                ],
                                descriptionText: "thread_can_outlive_the_parent_so_ownership_is_required",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "what_are_the_three_traits_for_closures",
                                answers: [
                                    Answer(id: UUID(), title: "fn_fnmut_fnonce", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_func_callable", isCorrect: false),
                                    Answer(id: UUID(), title: "fnstatic_fnshared_fnowned", isCorrect: false),
                                    Answer(id: UUID(), title: "copy_clone_drop", isCorrect: false)
                                ],
                                descriptionText: "these_three_traits_reflect_capture_methods",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "which_fn_trait_does_any_closure_implement",
                                answers: [
                                    Answer(id: UUID(), title: "fn", isCorrect: false),
                                    Answer(id: UUID(), title: "fnmut", isCorrect: false),
                                    Answer(id: UUID(), title: "fnonce", isCorrect: true),
                                    Answer(id: UUID(), title: "none", isCorrect: false)
                                ],
                                descriptionText: "any_closure_can_be_called_at_least_once",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "a_closure_that_modifies_an_external_variable_implements",
                                answers: [
                                    Answer(id: UUID(), title: "fn", isCorrect: false),
                                    Answer(id: UUID(), title: "fnmut", isCorrect: true),
                                    Answer(id: UUID(), title: "fnonce", isCorrect: false),
                                    Answer(id: UUID(), title: "copy", isCorrect: false)
                                ],
                                descriptionText: "modification_requires_mut_thats_fnmut",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "a_closure_that_moves_a_value_from_the_environment_implements",
                                answers: [
                                    Answer(id: UUID(), title: "fn", isCorrect: false),
                                    Answer(id: UUID(), title: "fnmut", isCorrect: false),
                                    Answer(id: UUID(), title: "fnonce", isCorrect: true),
                                    Answer(id: UUID(), title: "all_three", isCorrect: false)
                                ],
                                descriptionText: "with_move_operation_closure_can_only_be_called_once",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "how_does_function_syntax_differ_from_closure_syntax",
                                answers: [
                                    Answer(id: UUID(), title: "function_always_with_fn_closure_with_vertical_bars", isCorrect: true),
                                    Answer(id: UUID(), title: "closure_must_have_return", isCorrect: false),
                                    Answer(id: UUID(), title: "closures_have_no_body", isCorrect: false),
                                    Answer(id: UUID(), title: "functions_cannot_accept_parameters", isCorrect: false)
                                ],
                                descriptionText: "the_difference_is_precisely_in_vertical_bars_and_optional_type_annotations",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "do_you_always_need_to_specify_types_in_a_closure",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_fnmut", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_return_value", isCorrect: false)
                                ],
                                descriptionText: "compiler_usually_infers_types_automatically",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "when_might_explicit_type_annotation_be_needed_in_a_closure",
                                answers: [
                                    Answer(id: UUID(), title: "when_using_multithreading", isCorrect: false),
                                    Answer(id: UUID(), title: "when_compiler_cannot_infer_the_type", isCorrect: true),
                                    Answer(id: UUID(), title: "when_closure_is_empty", isCorrect: false),
                                    Answer(id: UUID(), title: "always_in_release", isCorrect: false)
                                ],
                                descriptionText: "closure_types_are_inferred_but_sometimes_clarification_is_needed",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_call_a_closure_first_with_a_string_then_with_a_number",
                                answers: [
                                    Answer(id: UUID(), title: "will_work", isCorrect: false),
                                    Answer(id: UUID(), title: "type_error", isCorrect: true),
                                    Answer(id: UUID(), title: "automatic_conversion", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_panic", isCorrect: false)
                                ],
                                descriptionText: "closure_type_is_fixed_on_first_call",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "which_closure_can_be_passed_to_sort_by_key",
                                answers: [
                                    Answer(id: UUID(), title: "only_fnonce", isCorrect: false),
                                    Answer(id: UUID(), title: "fnmut", isCorrect: true),
                                    Answer(id: UUID(), title: "fn", isCorrect: false),
                                    Answer(id: UUID(), title: "any", isCorrect: false)
                                ],
                                descriptionText: "sort_by_key_calls_the_closure_multiple_times",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "which_method_must_any_iterator_implement",
                                answers: [
                                    Answer(id: UUID(), title: "for_each", isCorrect: false),
                                    Answer(id: UUID(), title: "next", isCorrect: true),
                                    Answer(id: UUID(), title: "iter", isCorrect: false),
                                    Answer(id: UUID(), title: "map", isCorrect: false)
                                ],
                                descriptionText: "iterator_requires_defining_next",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "what_does_the_next_method_return",
                                answers: [
                                    Answer(id: UUID(), title: "element_directly", isCorrect: false),
                                    Answer(id: UUID(), title: "option", isCorrect: true),
                                    Answer(id: UUID(), title: "result_item_err", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_item", isCorrect: false)
                                ],
                                descriptionText: "next_returns_some_item_or_none",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_call_next_on_an_exhausted_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "panic", isCorrect: false),
                                    Answer(id: UUID(), title: "none", isCorrect: true),
                                    Answer(id: UUID(), title: "zero", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error", isCorrect: false)
                                ],
                                descriptionText: "after_the_end_iterator_returns_none",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "why_is_an_iterator_variable_usually_declared_as_mut",
                                answers: [
                                    Answer(id: UUID(), title: "otherwise_compiler_always_complains", isCorrect: false),
                                    Answer(id: UUID(), title: "next_modifies_internal_state", isCorrect: true),
                                    Answer(id: UUID(), title: "vector_requires_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "collect_requires_mut", isCorrect: false)
                                ],
                                descriptionText: "next_moves_the_iterator_pointer",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "how_do_iter_into_iter_iter_mut_methods_differ_for_a_vector",
                                answers: [
                                    Answer(id: UUID(), title: "all_the_same", isCorrect: false),
                                    Answer(id: UUID(), title: "iter_ref_t_into_iter_t_iter_mut_ref_mut_t", isCorrect: true),
                                    Answer(id: UUID(), title: "iter_copies_into_iter_references", isCorrect: false),
                                    Answer(id: UUID(), title: "iter_works_faster", isCorrect: false)
                                ],
                                descriptionText: "these_are_three_ways_to_traverse_by_reference_ownership_and_mutable_reference",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "what_is_iterator_laziness",
                                answers: [
                                    Answer(id: UUID(), title: "they_dont_compile_until_called", isCorrect: false),
                                    Answer(id: UUID(), title: "they_do_nothing_until_consumed", isCorrect: true),
                                    Answer(id: UUID(), title: "they_are_slow", isCorrect: false),
                                    Answer(id: UUID(), title: "they_only_work_in_release", isCorrect: false)
                                ],
                                descriptionText: "iterators_defer_computation_until_a_consuming_method",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "example_of_a_method_that_consumes_an_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "map", isCorrect: false),
                                    Answer(id: UUID(), title: "filter", isCorrect: false),
                                    Answer(id: UUID(), title: "sum", isCorrect: true),
                                    Answer(id: UUID(), title: "iter", isCorrect: false)
                                ],
                                descriptionText: "sum_calls_next_until_the_end_and_takes_the_iterator",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "what_happens_to_an_iterator_after_calling_sum",
                                answers: [
                                    Answer(id: UUID(), title: "can_be_used_again", isCorrect: false),
                                    Answer(id: UUID(), title: "its_moved_and_no_longer_accessible", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_empty", isCorrect: false),
                                    Answer(id: UUID(), title: "its_cloned", isCorrect: false)
                                ],
                                descriptionText: "sum_owns_the_iterator_and_exhausts_it",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "example_of_an_adapter_method_doesnt_consume_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "map", isCorrect: true),
                                    Answer(id: UUID(), title: "sum", isCorrect: false),
                                    Answer(id: UUID(), title: "collect", isCorrect: false),
                                    Answer(id: UUID(), title: "next", isCorrect: false)
                                ],
                                descriptionText: "adapter_returns_a_new_iterator_without_consuming_the_original",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "what_do_you_need_to_call_to_actually_execute_map",
                                answers: [
                                    Answer(id: UUID(), title: "collect", isCorrect: true),
                                    Answer(id: UUID(), title: "for_each", isCorrect: false),
                                    Answer(id: UUID(), title: "next", isCorrect: false),
                                    Answer(id: UUID(), title: "all_above", isCorrect: false)
                                ],
                                descriptionText: "map_is_lazy_collect_starts_traversal",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "what_will_collect_return_from_a_map_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "nothing", isCorrect: false),
                                    Answer(id: UUID(), title: "any_collection", isCorrect: true),
                                    Answer(id: UUID(), title: "only_vec", isCorrect: false),
                                    Answer(id: UUID(), title: "only_string", isCorrect: false)
                                ],
                                descriptionText: "collect_can_be_parameterized_into_different_collections",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "how_does_filter_work",
                                answers: [
                                    Answer(id: UUID(), title: "removes_none", isCorrect: false),
                                    Answer(id: UUID(), title: "keeps_elements_whose_closure_returns_true", isCorrect: true),
                                    Answer(id: UUID(), title: "sorts_elements", isCorrect: false),
                                    Answer(id: UUID(), title: "transforms_type", isCorrect: false)
                                ],
                                descriptionText: "filter_keeps_only_elements_for_which_the_condition_is_true",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "how_does_the_filter_closure_receive_elements",
                                answers: [
                                    Answer(id: UUID(), title: "by_value", isCorrect: false),
                                    Answer(id: UUID(), title: "by_reference", isCorrect: true),
                                    Answer(id: UUID(), title: "by_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "always_through_move", isCorrect: false)
                                ],
                                descriptionText: "filter_calls_the_closure_with_a_reference_to_the_element",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "what_does_the_for_each_method_do_for_an_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "returns_a_new_collection", isCorrect: false),
                                    Answer(id: UUID(), title: "applies_closure_to_each_element", isCorrect: true),
                                    Answer(id: UUID(), title: "sorts", isCorrect: false),
                                    Answer(id: UUID(), title: "zeros_the_iterator", isCorrect: false)
                                ],
                                descriptionText: "for_each_calls_the_closure_for_each_element",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "how_do_you_check_if_an_iterator_has_an_element_satisfying_a_condition",
                                answers: [
                                    Answer(id: UUID(), title: "map", isCorrect: false),
                                    Answer(id: UUID(), title: "any", isCorrect: true),
                                    Answer(id: UUID(), title: "all", isCorrect: false),
                                    Answer(id: UUID(), title: "find", isCorrect: false)
                                ],
                                descriptionText: "any_checks_if_the_closure_returns_true_at_least_once",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "how_does_all_differ_from_any",
                                answers: [
                                    Answer(id: UUID(), title: "all_requires_true_for_all", isCorrect: true),
                                    Answer(id: UUID(), title: "any_requires_true_for_all", isCorrect: false),
                                    Answer(id: UUID(), title: "all_only_works_with_vec", isCorrect: false),
                                    Answer(id: UUID(), title: "all_is_always_faster", isCorrect: false)
                                ],
                                descriptionText: "all_returns_true_if_the_condition_holds_for_all_elements",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "what_does_the_find_method_return",
                                answers: [
                                    Answer(id: UUID(), title: "bool", isCorrect: false),
                                    Answer(id: UUID(), title: "option", isCorrect: true),
                                    Answer(id: UUID(), title: "result", isCorrect: false),
                                    Answer(id: UUID(), title: "usize", isCorrect: false)
                                ],
                                descriptionText: "find_returns_some_first_element_or_none",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 34
                            Question(
                                id: UUID(),
                                title: "how_do_for_loops_and_iterators_differ",
                                answers: [
                                    Answer(id: UUID(), title: "for_is_always_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "for_is_syntactic_sugar_for_iterator", isCorrect: true),
                                    Answer(id: UUID(), title: "iterator_only_works_with_vec", isCorrect: false),
                                    Answer(id: UUID(), title: "for_uses_pointers", isCorrect: false)
                                ],
                                descriptionText: "for_internally_creates_and_consumes_an_iterator",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 35
                            Question(
                                id: UUID(),
                                title: "why_are_iterators_in_rust_considered_zero_cost_abstraction",
                                answers: [
                                    Answer(id: UUID(), title: "theyre_free", isCorrect: false),
                                    Answer(id: UUID(), title: "after_compilation_they_add_no_overhead", isCorrect: true),
                                    Answer(id: UUID(), title: "theyre_always_inlined", isCorrect: false),
                                    Answer(id: UUID(), title: "they_only_work_in_release", isCorrect: false)
                                ],
                                descriptionText: "iterators_compile_to_code_at_the_level_of_manual_loops",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 36
                            Question(
                                id: UUID(),
                                title: "what_does_the_enumerate_method_do",
                                answers: [
                                    Answer(id: UUID(), title: "numbers_the_collection_in_println", isCorrect: false),
                                    Answer(id: UUID(), title: "adds_an_index_to_each_element", isCorrect: true),
                                    Answer(id: UUID(), title: "sorts", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_usize", isCorrect: false)
                                ],
                                descriptionText: "enumerate_returns_pairs_index_element",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 37
                            Question(
                                id: UUID(),
                                title: "what_does_zip_do",
                                answers: [
                                    Answer(id: UUID(), title: "combines_two_iterators_into_tuples", isCorrect: true),
                                    Answer(id: UUID(), title: "joins_strings", isCorrect: false),
                                    Answer(id: UUID(), title: "removes_duplicates", isCorrect: false),
                                    Answer(id: UUID(), title: "does_flatmap", isCorrect: false)
                                ],
                                descriptionText: "zip_combines_elements_in_pairs",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 38
                            Question(
                                id: UUID(),
                                title: "what_does_the_chain_method_do",
                                answers: [
                                    Answer(id: UUID(), title: "joins_two_iterators_sequentially", isCorrect: true),
                                    Answer(id: UUID(), title: "does_merge_sort", isCorrect: false),
                                    Answer(id: UUID(), title: "joins_strings", isCorrect: false),
                                    Answer(id: UUID(), title: "concatenates_vec", isCorrect: false)
                                ],
                                descriptionText: "chain_creates_one_iterator_from_two",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 39
                            Question(
                                id: UUID(),
                                title: "what_does_the_take_method_do",
                                answers: [
                                    Answer(id: UUID(), title: "takes_the_first_n_elements", isCorrect: true),
                                    Answer(id: UUID(), title: "removes_the_first_n_elements", isCorrect: false),
                                    Answer(id: UUID(), title: "does_clone", isCorrect: false),
                                    Answer(id: UUID(), title: "only_works_with_vec", isCorrect: false)
                                ],
                                descriptionText: "take_limits_the_number_of_iterations",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            ),
                            
                            // Question 40
                            Question(
                                id: UUID(),
                                title: "what_does_the_skip_method_do",
                                answers: [
                                    Answer(id: UUID(), title: "skips_the_first_n_elements", isCorrect: true),
                                    Answer(id: UUID(), title: "removes_duplicates", isCorrect: false),
                                    Answer(id: UUID(), title: "skips_none", isCorrect: false),
                                    Answer(id: UUID(), title: "sorts", isCorrect: false)
                                ],
                                descriptionText: "skip_shifts_the_iteration_start",
                                descriptionLink: "functional_language_features_iterators_and_closures_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "smart_pointers",
                        priority: 11,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_is_a_smart_pointer_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "any_variable_with_reference_ref_t", isCorrect: false),
                                    Answer(id: UUID(), title: "a_struct_that_behaves_like_a_pointer_and_has_additional_behavior", isCorrect: true),
                                    Answer(id: UUID(), title: "any_wrapper_over_vec_t", isCorrect: false),
                                    Answer(id: UUID(), title: "any_type_with_copy", isCorrect: false)
                                ],
                                descriptionText: "smart_pointer_is_a_struct_that_mimics_a_pointer_and_implements_traits_like_deref_drop",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "what_does_box_t_do",
                                answers: [
                                    Answer(id: UUID(), title: "places_value_on_the_stack", isCorrect: false),
                                    Answer(id: UUID(), title: "places_value_in_static_memory", isCorrect: false),
                                    Answer(id: UUID(), title: "places_value_on_the_heap", isCorrect: true),
                                    Answer(id: UUID(), title: "clones_value_on_each_access", isCorrect: false)
                                ],
                                descriptionText: "box_stores_a_thin_pointer_to_a_value_on_the_heap",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "when_is_it_appropriate_to_use_box_t",
                                answers: [
                                    Answer(id: UUID(), title: "always_for_fixed_size_values", isCorrect: false),
                                    Answer(id: UUID(), title: "when_you_need_a_known_size_type_for_a_recursive_structure", isCorrect: true),
                                    Answer(id: UUID(), title: "to_speed_up_cache_line_access", isCorrect: false),
                                    Answer(id: UUID(), title: "to_automatically_share_ownership", isCorrect: false)
                                ],
                                descriptionText: "box_breaks_infinite_recursion_in_size_eg_in_cons_i32_box_list",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_happens_when_box_t_goes_out_of_scope",
                                answers: [
                                    Answer(id: UUID(), title: "only_the_pointer_on_the_stack_is_freed", isCorrect: false),
                                    Answer(id: UUID(), title: "only_the_heap_is_freed", isCorrect: false),
                                    Answer(id: UUID(), title: "both_the_stack_pointer_and_heap_data_are_freed", isCorrect: true),
                                    Answer(id: UUID(), title: "nothing_garbage_collector_frees_later", isCorrect: false)
                                ],
                                descriptionText: "drop_is_implemented_to_free_both_the_box_and_stored_data",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "why_doesnt_enum_list_cons_i32_list_nil_compile",
                                answers: [
                                    Answer(id: UUID(), title: "type_error", isCorrect: false),
                                    Answer(id: UUID(), title: "recursive_type_of_infinite_size", isCorrect: true),
                                    Answer(id: UUID(), title: "cannot_have_nil_in_enum", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_doesnt_support_such_enums", isCorrect: false)
                                ],
                                descriptionText: "list_size_cannot_be_computed_need_indirection_via_pointer_box_rc_ref",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "what_does_the_deref_trait_do",
                                answers: [
                                    Answer(id: UUID(), title: "manages_lifetimes", isCorrect: false),
                                    Answer(id: UUID(), title: "allows_using_star_operator_and_reference_coercions", isCorrect: true),
                                    Answer(id: UUID(), title: "allows_copying_without_cloning", isCorrect: false),
                                    Answer(id: UUID(), title: "enables_garbage_collection", isCorrect: false)
                                ],
                                descriptionText: "deref_deref_ref_self_ref_target_describes_what_the_type_dereferences_to",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "why_cant_mybox_t_without_deref_be_dereferenced_with_star_y",
                                answers: [
                                    Answer(id: UUID(), title: "no_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "drop_not_implemented", isCorrect: false),
                                    Answer(id: UUID(), title: "deref_not_implemented", isCorrect: true),
                                    Answer(id: UUID(), title: "type_must_be_enum", isCorrect: false)
                                ],
                                descriptionText: "dereferencing_custom_smart_pointers_requires_deref",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "what_is_derefmut_for",
                                answers: [
                                    Answer(id: UUID(), title: "for_coercion_ref_t_ref_u", isCorrect: false),
                                    Answer(id: UUID(), title: "for_coercion_ref_mut_t_ref_mut_u", isCorrect: true),
                                    Answer(id: UUID(), title: "for_default_copying", isCorrect: false),
                                    Answer(id: UUID(), title: "for_resource_cleanup", isCorrect: false)
                                ],
                                descriptionText: "derefmut_allows_dereferencing_coercing_mutable_references",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "what_is_the_automatic_conversion_of_references_through_deref_in_function_signatures_called",
                                answers: [
                                    Answer(id: UUID(), title: "lifting", isCorrect: false),
                                    Answer(id: UUID(), title: "monomorphization", isCorrect: false),
                                    Answer(id: UUID(), title: "deref_coercion", isCorrect: true),
                                    Answer(id: UUID(), title: "copy_elision", isCorrect: false)
                                ],
                                descriptionText: "compiler_automatically_inserts_deref_calls_to_match_expected_reference_type",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "what_is_true_about_deref_coercion",
                                answers: [
                                    Answer(id: UUID(), title: "only_works_for_box_t", isCorrect: false),
                                    Answer(id: UUID(), title: "only_works_for_methods_not_functions", isCorrect: false),
                                    Answer(id: UUID(), title: "works_for_types_implementing_deref_derefmut", isCorrect: true),
                                    Answer(id: UUID(), title: "only_works_in_nightly", isCorrect: false)
                                ],
                                descriptionText: "conditions_are_having_the_corresponding_trait_implementations",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "which_coercion_is_allowed",
                                answers: [
                                    Answer(id: UUID(), title: "ref_mut_t_to_ref_t", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_t_to_ref_mut_t", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_t_to_t", isCorrect: false),
                                    Answer(id: UUID(), title: "t_to_ref_t_always", isCorrect: false)
                                ],
                                descriptionText: "mutable_reference_can_be_downgraded_to_immutable_reverse_is_forbidden_by_borrowing_rules",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "what_is_the_drop_trait_for",
                                answers: [
                                    Answer(id: UUID(), title: "allows_copying_types_by_value", isCorrect: false),
                                    Answer(id: UUID(), title: "defines_behavior_when_going_out_of_scope", isCorrect: true),
                                    Answer(id: UUID(), title: "speeds_up_memory_deallocation", isCorrect: false),
                                    Answer(id: UUID(), title: "replaces_raii", isCorrect: false)
                                ],
                                descriptionText: "drop_ref_mut_self_is_called_automatically_on_destruction",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "can_you_explicitly_call_the_drop_method_from_drop",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_but_only_in_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "no_need_to_use_std_mem_drop_value", isCorrect: true),
                                    Answer(id: UUID(), title: "can_but_only_for_box_t", isCorrect: false)
                                ],
                                descriptionText: "direct_call_value_drop_is_forbidden_use_free_function_drop",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "order_of_variable_destruction_in_a_block",
                                answers: [
                                    Answer(id: UUID(), title: "in_order_of_declaration", isCorrect: false),
                                    Answer(id: UUID(), title: "in_reverse_order_of_declaration", isCorrect: true),
                                    Answer(id: UUID(), title: "random", isCorrect: false),
                                    Answer(id: UUID(), title: "by_name", isCorrect: false)
                                ],
                                descriptionText: "lifo_last_created_first_destroyed",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "what_is_rc_t_for",
                                answers: [
                                    Answer(id: UUID(), title: "single_ownership", isCorrect: false),
                                    Answer(id: UUID(), title: "multiple_ownership_of_one_value_in_multithreaded_context", isCorrect: false),
                                    Answer(id: UUID(), title: "multiple_ownership_of_one_value_in_single_threaded_context", isCorrect: true),
                                    Answer(id: UUID(), title: "thread_synchronization", isCorrect: false)
                                ],
                                descriptionText: "rc_is_reference_counting_but_only_for_single_thread",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "what_does_rc_clone_do",
                                answers: [
                                    Answer(id: UUID(), title: "deep_copies_data", isCorrect: false),
                                    Answer(id: UUID(), title: "increments_strong_reference_count", isCorrect: true),
                                    Answer(id: UUID(), title: "copies_only_header_and_data", isCorrect: false),
                                    Answer(id: UUID(), title: "moves_data", isCorrect: false)
                                ],
                                descriptionText: "fast_increment_of_counter_data_is_not_copied",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "why_is_calling_rc_clone_ref_rc_instead_of_rc_clone_recommended",
                                answers: [
                                    Answer(id: UUID(), title: "its_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "its_the_only_way", isCorrect: false),
                                    Answer(id: UUID(), title: "its_an_idiom_to_explicitly_denote_cheap_reference_cloning", isCorrect: true),
                                    Answer(id: UUID(), title: "otherwise_wont_compile", isCorrect: false)
                                ],
                                descriptionText: "signals_to_the_reader_that_no_deep_copying_occurs",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "what_does_rc_strong_count_ref_rc_show",
                                answers: [
                                    Answer(id: UUID(), title: "number_of_weak_references", isCorrect: false),
                                    Answer(id: UUID(), title: "number_of_all_references", isCorrect: false),
                                    Answer(id: UUID(), title: "number_of_strong_references", isCorrect: true),
                                    Answer(id: UUID(), title: "shows_nothing_deprecated", isCorrect: false)
                                ],
                                descriptionText: "shows_the_number_of_strong_references",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "when_will_data_inside_rc_t_be_freed",
                                answers: [
                                    Answer(id: UUID(), title: "when_strong_count_equals_0", isCorrect: true),
                                    Answer(id: UUID(), title: "when_weak_count_equals_0", isCorrect: false),
                                    Answer(id: UUID(), title: "when_strong_count_equals_weak_count", isCorrect: false),
                                    Answer(id: UUID(), title: "when_both_owner_variables_go_out_of_scope", isCorrect: false)
                                ],
                                descriptionText: "weak_references_dont_prevent_deallocation",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "can_you_modify_data_through_rc_t",
                                answers: [
                                    Answer(id: UUID(), title: "yes_through_mut_rc", isCorrect: false),
                                    Answer(id: UUID(), title: "no_never", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_you_wrap_data_in_refcell_t_and_use_rc_refcell_t", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_if_you_call_rc_get_mut", isCorrect: false)
                                ],
                                descriptionText: "rc_t_gives_only_immutable_access_for_mutation_interior_mutability_through_refcell",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "when_does_rc_get_mut_ref_mut_rc_return_some_ref_mut_t",
                                answers: [
                                    Answer(id: UUID(), title: "always", isCorrect: false),
                                    Answer(id: UUID(), title: "if_strong_references_are_exactly_1", isCorrect: true),
                                    Answer(id: UUID(), title: "if_weak_references_are_0", isCorrect: false),
                                    Answer(id: UUID(), title: "never", isCorrect: false)
                                ],
                                descriptionText: "safe_mutation_possible_only_with_sole_ownership",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "what_does_refcell_t_do",
                                answers: [
                                    Answer(id: UUID(), title: "moves_borrow_checking_to_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "adds_thread_safety", isCorrect: false),
                                    Answer(id: UUID(), title: "improves_mutation_performance", isCorrect: false),
                                    Answer(id: UUID(), title: "guarantees_no_panics", isCorrect: false)
                                ],
                                descriptionText: "compiler_allows_but_checks_number_of_ref_refmut_are_performed_at_runtime",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "what_will_borrow_on_refcell_t_return",
                                answers: [
                                    Answer(id: UUID(), title: "ref_t", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_mut_t", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_of_t", isCorrect: true),
                                    Answer(id: UUID(), title: "refmut_of_t", isCorrect: false)
                                ],
                                descriptionText: "its_a_smart_pointer_with_deref_to_ref_t",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "what_will_borrow_mut_return",
                                answers: [
                                    Answer(id: UUID(), title: "ref_mut_t", isCorrect: false),
                                    Answer(id: UUID(), title: "refmut_of_t", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_of_t", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_t", isCorrect: false)
                                ],
                                descriptionText: "smart_pointer_with_derefmut_to_ref_mut_t",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "what_happens_with_two_borrow_mut_in_the_same_scope",
                                answers: [
                                    Answer(id: UUID(), title: "compilation_fails", isCorrect: false),
                                    Answer(id: UUID(), title: "program_panics_at_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "second_returns_none", isCorrect: false),
                                    Answer(id: UUID(), title: "everythings_fine", isCorrect: false)
                                ],
                                descriptionText: "violation_of_only_one_mutable_reference_rule_panic_with_borrowmuterror",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "can_you_have_borrow_and_borrow_mut_active_simultaneously",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_t_sync", isCorrect: false),
                                    Answer(id: UUID(), title: "no_leads_to_panic", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_platform", isCorrect: false)
                                ],
                                descriptionText: "either_many_ref_or_one_refmut",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "the_rc_refcell_t_combination_provides",
                                answers: [
                                    Answer(id: UUID(), title: "multiple_owners_of_immutable_data", isCorrect: false),
                                    Answer(id: UUID(), title: "multiple_owners_with_mutation_capability_via_interior_mutability", isCorrect: true),
                                    Answer(id: UUID(), title: "single_owner_and_mutation", isCorrect: false),
                                    Answer(id: UUID(), title: "thread_safety", isCorrect: false)
                                ],
                                descriptionText: "multiple_ownership_plus_interior_mutability",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "what_is_interior_mutability",
                                answers: [
                                    Answer(id: UUID(), title: "mutation_through_unsafe_always", isCorrect: false),
                                    Answer(id: UUID(), title: "ability_to_change_internal_value_with_externally_immutable_container", isCorrect: true),
                                    Answer(id: UUID(), title: "mutation_only_in_tests", isCorrect: false),
                                    Answer(id: UUID(), title: "technique_exclusively_with_box_t", isCorrect: false)
                                ],
                                descriptionText: "mutating_through_immutable_interface",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "why_are_reference_cycles_with_rc_t_dangerous",
                                answers: [
                                    Answer(id: UUID(), title: "lead_to_data_race", isCorrect: false),
                                    Answer(id: UUID(), title: "lead_to_memory_leak", isCorrect: true),
                                    Answer(id: UUID(), title: "lead_to_ub", isCorrect: false),
                                    Answer(id: UUID(), title: "lead_to_double_free", isCorrect: false)
                                ],
                                descriptionText: "strong_references_dont_drop_to_zero_drop_is_not_called",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "how_to_avoid_reference_cycle_in_parent_children_tree",
                                answers: [
                                    Answer(id: UUID(), title: "use_box_t", isCorrect: false),
                                    Answer(id: UUID(), title: "use_weak_t_for_parent_reference", isCorrect: true),
                                    Answer(id: UUID(), title: "forbid_parents", isCorrect: false),
                                    Answer(id: UUID(), title: "use_refcell_t", isCorrect: false)
                                ],
                                descriptionText: "weak_reference_doesnt_increment_strong_count",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "what_does_rc_downgrade_ref_rc_return",
                                answers: [
                                    Answer(id: UUID(), title: "rc_t", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_t", isCorrect: false),
                                    Answer(id: UUID(), title: "weak_t", isCorrect: true),
                                    Answer(id: UUID(), title: "option_rc_t", isCorrect: false)
                                ],
                                descriptionText: "returns_weak_reference",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "how_to_get_rc_t_from_weak_t",
                                answers: [
                                    Answer(id: UUID(), title: "clone", isCorrect: false),
                                    Answer(id: UUID(), title: "upgrade", isCorrect: true),
                                    Answer(id: UUID(), title: "try_clone", isCorrect: false),
                                    Answer(id: UUID(), title: "as_rc", isCorrect: false)
                                ],
                                descriptionText: "upgrade_returns_option_rc_t_if_object_still_alive",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "when_does_weak_t_stop_being_a_valid_reference",
                                answers: [
                                    Answer(id: UUID(), title: "when_weak_count_equals_0", isCorrect: false),
                                    Answer(id: UUID(), title: "when_strong_count_equals_0", isCorrect: true),
                                    Answer(id: UUID(), title: "when_both_variables_go_out_of_scope", isCorrect: false),
                                    Answer(id: UUID(), title: "never", isCorrect: false)
                                ],
                                descriptionText: "when_strong_count_equals_0_data_is_freed_upgrade_returns_none",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 34
                            Question(
                                id: UUID(),
                                title: "what_does_rc_weak_count_ref_rc_show",
                                answers: [
                                    Answer(id: UUID(), title: "number_of_weak_references", isCorrect: true),
                                    Answer(id: UUID(), title: "number_of_strong_references", isCorrect: false),
                                    Answer(id: UUID(), title: "total_number_of_references", isCorrect: false),
                                    Answer(id: UUID(), title: "not_publicly_available", isCorrect: false)
                                ],
                                descriptionText: "shows_the_weak_reference_count",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 35
                            Question(
                                id: UUID(),
                                title: "can_rc_t_be_made_thread_safe",
                                answers: [
                                    Answer(id: UUID(), title: "yes_with_mutex_t", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_by_using_arc_t_instead_of_rc_t", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_through_refcell_t", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: false)
                                ],
                                descriptionText: "for_multithreading_arc_t_is_used",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 36
                            Question(
                                id: UUID(),
                                title: "why_couldnt_vec_string_be_stored_in_mock_object_messenger_example_without_refcell",
                                answers: [
                                    Answer(id: UUID(), title: "cannot_allocate_in_tests", isCorrect: false),
                                    Answer(id: UUID(), title: "method_send_ref_self_takes_ref_self_but_mutation_requires_ref_mut_self", isCorrect: true),
                                    Answer(id: UUID(), title: "vec_is_not_send", isCorrect: false),
                                    Answer(id: UUID(), title: "vec_is_not_sync", isCorrect: false)
                                ],
                                descriptionText: "interior_mutability_through_refcell_allows_mutation_with_ref_self",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 37
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_call_two_borrow_mut_in_a_row_in_mock_object",
                                answers: [
                                    Answer(id: UUID(), title: "compilation_breaks", isCorrect: false),
                                    Answer(id: UUID(), title: "panic_triggers", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_two_independent_refmut", isCorrect: false),
                                    Answer(id: UUID(), title: "copies_data", isCorrect: false)
                                ],
                                descriptionText: "runtime_panic_on_borrow_rule_violation",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 38
                            Question(
                                id: UUID(),
                                title: "is_box_t_a_thin_pointer",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: true),
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_t", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_nightly", isCorrect: false)
                                ],
                                descriptionText: "stores_only_address_plus_metadata_for_dst_size_is_known",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 39
                            Question(
                                id: UUID(),
                                title: "what_is_box_dyn_trait_useful_for",
                                answers: [
                                    Answer(id: UUID(), title: "for_generics", isCorrect: false),
                                    Answer(id: UUID(), title: "for_storing_values_of_concrete_type", isCorrect: false),
                                    Answer(id: UUID(), title: "for_dynamic_dispatch_via_trait_object", isCorrect: true),
                                    Answer(id: UUID(), title: "to_speed_up_compilation", isCorrect: false)
                                ],
                                descriptionText: "enables_trait_objects_and_dynamic_dispatch",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 40
                            Question(
                                id: UUID(),
                                title: "can_you_dereference_box_t_with_star_operator",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_thanks_to_deref", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_t_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "only_through_unsafe", isCorrect: false)
                                ],
                                descriptionText: "deref_trait_allows_dereferencing",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 41
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_panic_in_drop_drop",
                                answers: [
                                    Answer(id: UUID(), title: "always_ub", isCorrect: false),
                                    Answer(id: UUID(), title: "allowed_but_may_lead_to_double_panic_and_abort", isCorrect: true),
                                    Answer(id: UUID(), title: "ignored", isCorrect: false),
                                    Answer(id: UUID(), title: "forbidden_by_compiler", isCorrect: false)
                                ],
                                descriptionText: "panic_in_drop_is_dangerous_during_ongoing_panic_double_panic",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 42
                            Question(
                                id: UUID(),
                                title: "what_doesnt_refcell_t_do",
                                answers: [
                                    Answer(id: UUID(), title: "allows_mutation_with_ref_self", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_type_thread_safe", isCorrect: true),
                                    Answer(id: UUID(), title: "checks_borrows_at_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_ref_refmut", isCorrect: false)
                                ],
                                descriptionText: "refcell_is_not_thread_safe",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 43
                            Question(
                                id: UUID(),
                                title: "why_can_ref_string_be_coerced_to_ref_str",
                                answers: [
                                    Answer(id: UUID(), title: "special_compiler_magic", isCorrect: false),
                                    Answer(id: UUID(), title: "because_string_deref_target_str", isCorrect: true),
                                    Answer(id: UUID(), title: "because_str_deref_string", isCorrect: false),
                                    Answer(id: UUID(), title: "because_string_asref_str_and_its_automatic", isCorrect: false)
                                ],
                                descriptionText: "string_implements_deref_with_target_str",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 44
                            Question(
                                id: UUID(),
                                title: "what_is_a_recursive_type_with_known_size",
                                answers: [
                                    Answer(id: UUID(), title: "type_where_all_variants_are_equal_in_size", isCorrect: false),
                                    Answer(id: UUID(), title: "recursive_type_where_recursion_goes_through_pointer_box_rc_ref", isCorrect: true),
                                    Answer(id: UUID(), title: "type_that_doesnt_use_box", isCorrect: false),
                                    Answer(id: UUID(), title: "type_whose_size_is_computed_at_runtime", isCorrect: false)
                                ],
                                descriptionText: "recursion_via_indirection_makes_size_computable",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 45
                            Question(
                                id: UUID(),
                                title: "what_happens_when_printing_cyclic_rc_structure_without_protection",
                                answers: [
                                    Answer(id: UUID(), title: "everything_prints", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_forbids", isCorrect: false),
                                    Answer(id: UUID(), title: "possible_stack_overflow_infinite_recursion", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_none", isCorrect: false)
                                ],
                                descriptionText: "infinite_cycle_causes_stack_overflow",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 46
                            Question(
                                id: UUID(),
                                title: "when_is_it_appropriate_to_call_drop_x_manually",
                                answers: [
                                    Answer(id: UUID(), title: "never", isCorrect: false),
                                    Answer(id: UUID(), title: "when_need_to_free_resource_before_end_of_scope_eg_mutex", isCorrect: true),
                                    Answer(id: UUID(), title: "to_speed_up_program", isCorrect: false),
                                    Answer(id: UUID(), title: "to_decrease_rc_strong_count", isCorrect: false)
                                ],
                                descriptionText: "early_drop_useful_for_releasing_locks_and_resources",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 47
                            Question(
                                id: UUID(),
                                title: "what_does_weak_t_store",
                                answers: [
                                    Answer(id: UUID(), title: "strong_reference", isCorrect: false),
                                    Answer(id: UUID(), title: "weak_reference_not_preventing_deallocation", isCorrect: true),
                                    Answer(id: UUID(), title: "copy_of_data", isCorrect: false),
                                    Answer(id: UUID(), title: "offset_for_zst", isCorrect: false)
                                ],
                                descriptionText: "weak_doesnt_keep_data_alive",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 48
                            Question(
                                id: UUID(),
                                title: "how_to_check_if_object_pointed_to_by_weak_t_is_alive",
                                answers: [
                                    Answer(id: UUID(), title: "is_alive", isCorrect: false),
                                    Answer(id: UUID(), title: "try", isCorrect: false),
                                    Answer(id: UUID(), title: "upgrade_is_some", isCorrect: true),
                                    Answer(id: UUID(), title: "alive", isCorrect: false)
                                ],
                                descriptionText: "upgrade_returns_some_if_still_alive",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 49
                            Question(
                                id: UUID(),
                                title: "how_does_rc_t_differ_from_box_t",
                                answers: [
                                    Answer(id: UUID(), title: "rc_is_single_owner_box_is_shared", isCorrect: false),
                                    Answer(id: UUID(), title: "rc_is_shared_owner_box_is_single", isCorrect: true),
                                    Answer(id: UUID(), title: "both_are_shared_owners", isCorrect: false),
                                    Answer(id: UUID(), title: "both_are_single_owners", isCorrect: false)
                                ],
                                descriptionText: "rc_allows_multiple_owners_box_is_single_ownership",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 50
                            Question(
                                id: UUID(),
                                title: "what_happens_with_refmut_t_if_you_try_to_take_borrow_in_parallel",
                                answers: [
                                    Answer(id: UUID(), title: "returns_another_refmut", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_ref", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_panic", isCorrect: true),
                                    Answer(id: UUID(), title: "compiles_but_ub", isCorrect: false)
                                ],
                                descriptionText: "cannot_have_immutable_and_mutable_borrows_simultaneously",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 51
                            Question(
                                id: UUID(),
                                title: "why_is_refcell_t_only_for_single_threaded_code",
                                answers: [
                                    Answer(id: UUID(), title: "doesnt_implement_sync_send", isCorrect: true),
                                    Answer(id: UUID(), title: "because_its_slow", isCorrect: false),
                                    Answer(id: UUID(), title: "requires_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "because_its_deprecated", isCorrect: false)
                                ],
                                descriptionText: "refcell_not_thread_safe_lacks_sync_send",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 52
                            Question(
                                id: UUID(),
                                title: "what_properties_does_rc_refcell_t_provide",
                                answers: [
                                    Answer(id: UUID(), title: "multiple_mutation_without_checks", isCorrect: false),
                                    Answer(id: UUID(), title: "multiple_mutation_with_compile_time_checks", isCorrect: false),
                                    Answer(id: UUID(), title: "multiple_ownership_plus_runtime_mutation_checks", isCorrect: true),
                                    Answer(id: UUID(), title: "multiple_ownership_plus_thread_safety", isCorrect: false)
                                ],
                                descriptionText: "combines_shared_ownership_with_interior_mutability",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 53
                            Question(
                                id: UUID(),
                                title: "what_happens_if_last_rc_t_is_destroyed_but_weak_t_remain",
                                answers: [
                                    Answer(id: UUID(), title: "data_lives_until_last_weak", isCorrect: false),
                                    Answer(id: UUID(), title: "data_freed_weak_upgrade_returns_none", isCorrect: true),
                                    Answer(id: UUID(), title: "data_not_freed", isCorrect: false),
                                    Answer(id: UUID(), title: "panic", isCorrect: false)
                                ],
                                descriptionText: "weak_references_dont_keep_data_alive",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 54
                            Question(
                                id: UUID(),
                                title: "why_are_just_references_ref_t_in_recursive_type_inconvenient",
                                answers: [
                                    Answer(id: UUID(), title: "always_slower", isCorrect: false),
                                    Answer(id: UUID(), title: "require_lifetimes_and_often_dont_express_needed_ownership", isCorrect: true),
                                    Answer(id: UUID(), title: "forbidden_in_enum", isCorrect: false),
                                    Answer(id: UUID(), title: "dont_work_with_vec", isCorrect: false)
                                ],
                                descriptionText: "lifetimes_complicate_ownership_semantics",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 55
                            Question(
                                id: UUID(),
                                title: "what_is_derive_debug_useful_for_in_list_tree_examples",
                                answers: [
                                    Answer(id: UUID(), title: "for_cloning", isCorrect: false),
                                    Answer(id: UUID(), title: "for_automatic_drop", isCorrect: false),
                                    Answer(id: UUID(), title: "for_convenient_debug_printing_of_structures", isCorrect: true),
                                    Answer(id: UUID(), title: "for_optimizations", isCorrect: false)
                                ],
                                descriptionText: "enables_debug_formatting",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 56
                            Question(
                                id: UUID(),
                                title: "why_can_rc_plus_refcell_lead_to_leaks",
                                answers: [
                                    Answer(id: UUID(), title: "because_of_refcell", isCorrect: false),
                                    Answer(id: UUID(), title: "because_of_panics", isCorrect: false),
                                    Answer(id: UUID(), title: "because_of_strong_reference_cycles_in_rc", isCorrect: true),
                                    Answer(id: UUID(), title: "because_of_deref", isCorrect: false)
                                ],
                                descriptionText: "cycles_prevent_reference_count_from_reaching_zero",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 57
                            Question(
                                id: UUID(),
                                title: "how_to_break_cycle_in_rc_graph",
                                answers: [
                                    Answer(id: UUID(), title: "use_box_instead_of_rc", isCorrect: false),
                                    Answer(id: UUID(), title: "use_weak_in_edges_where_ownership_not_required", isCorrect: true),
                                    Answer(id: UUID(), title: "switch_to_refcell", isCorrect: false),
                                    Answer(id: UUID(), title: "forbidden_in_rust", isCorrect: false)
                                ],
                                descriptionText: "weak_breaks_strong_reference_cycles",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 58
                            Question(
                                id: UUID(),
                                title: "whats_true_about_box_t_and_performance",
                                answers: [
                                    Answer(id: UUID(), title: "always_faster_than_stack", isCorrect: false),
                                    Answer(id: UUID(), title: "no_overhead_except_heap_indirection", isCorrect: true),
                                    Answer(id: UUID(), title: "10x_slower_everywhere", isCorrect: false),
                                    Answer(id: UUID(), title: "significantly_slows_compilation", isCorrect: false)
                                ],
                                descriptionText: "box_is_zero_cost_abstraction_except_heap_allocation",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 59
                            Question(
                                id: UUID(),
                                title: "can_you_store_unsized_types_dst_in_box",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_eg_box_str_or_box_t", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_nightly", isCorrect: false),
                                    Answer(id: UUID(), title: "only_through_unsafe", isCorrect: false)
                                ],
                                descriptionText: "box_supports_dynamically_sized_types",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 60
                            Question(
                                id: UUID(),
                                title: "why_shouldnt_you_call_drop_in_drop_drop_on_same_object",
                                answers: [
                                    Answer(id: UUID(), title: "it_speeds_up", isCorrect: false),
                                    Answer(id: UUID(), title: "leads_to_double_destruction_panic", isCorrect: true),
                                    Answer(id: UUID(), title: "requires_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "meaningless_no_such_api", isCorrect: false)
                                ],
                                descriptionText: "double_drop_causes_undefined_behavior",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 61
                            Question(
                                id: UUID(),
                                title: "what_makes_ref_t_useful",
                                answers: [
                                    Answer(id: UUID(), title: "its_ref_t_with_borrow_counting", isCorrect: true),
                                    Answer(id: UUID(), title: "its_rc_t", isCorrect: false),
                                    Answer(id: UUID(), title: "its_box_t", isCorrect: false),
                                    Answer(id: UUID(), title: "its_weak_t", isCorrect: false)
                                ],
                                descriptionText: "ref_tracks_borrows_at_runtime",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 62
                            Question(
                                id: UUID(),
                                title: "what_if_ref_t_hasnt_left_scope_and_we_take_borrow_mut",
                                answers: [
                                    Answer(id: UUID(), title: "returns_some", isCorrect: false),
                                    Answer(id: UUID(), title: "will_panic_with_borrowmuterror", isCorrect: true),
                                    Answer(id: UUID(), title: "compilation_fails", isCorrect: false),
                                    Answer(id: UUID(), title: "implicit_drop_occurs", isCorrect: false)
                                ],
                                descriptionText: "cannot_have_immutable_and_mutable_borrows_at_same_time",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 63
                            Question(
                                id: UUID(),
                                title: "why_doesnt_rc_t_have_method_to_always_get_ref_mut_t",
                                answers: [
                                    Answer(id: UUID(), title: "there_is_as_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "there_is_get_unchecked_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "because_there_can_be_multiple_owners_and_unique_mutation_isnt_safe", isCorrect: true),
                                    Answer(id: UUID(), title: "because_t_may_not_be_copy", isCorrect: false)
                                ],
                                descriptionText: "multiple_ownership_prevents_exclusive_mutable_access",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 64
                            Question(
                                id: UUID(),
                                title: "what_does_cons_rc_refcell_i32_rc_list_mean_for_mutation",
                                answers: [
                                    Answer(id: UUID(), title: "cannot_mutate", isCorrect: false),
                                    Answer(id: UUID(), title: "can_only_mutate_tail", isCorrect: false),
                                    Answer(id: UUID(), title: "can_mutate_number_inside_list_via_borrow_mut", isCorrect: true),
                                    Answer(id: UUID(), title: "can_only_mutate_through_unsafe", isCorrect: false)
                                ],
                                descriptionText: "refcell_allows_interior_mutability_of_shared_data",
                                descriptionLink: "smart_pointers_link"
                            ),
                            
                            // Question 65
                            Question(
                                id: UUID(),
                                title: "whats_the_main_advantage_of_smart_pointers_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "garbage_collector", isCorrect: false),
                                    Answer(id: UUID(), title: "zero_cost_abstractions_when_used_correctly", isCorrect: true),
                                    Answer(id: UUID(), title: "automatic_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "ability_to_bypass_borrow_checker_everywhere", isCorrect: false)
                                ],
                                descriptionText: "smart_pointers_provide_safety_without_runtime_overhead",
                                descriptionLink: "smart_pointers_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "fearless_concurrency",
                        priority: 12,
                        questions: [
                            // Question 1
                            Question(
                                id: UUID(),
                                title: "what_is_a_thread_in_the_context_of_rust_standard_library",
                                answers: [
                                    Answer(id: UUID(), title: "lightweight_green_thread_of_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "one_to_one_correspondence_with_os_thread", isCorrect: true),
                                    Answer(id: UUID(), title: "os_process", isCorrect: false),
                                    Answer(id: UUID(), title: "asynchronous_task", isCorrect: false)
                                ],
                                descriptionText: "rust_standard_library_uses_one_to_one_model_os_thread_per_thread",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 2
                            Question(
                                id: UUID(),
                                title: "what_does_thread_spawn_do",
                                answers: [
                                    Answer(id: UUID(), title: "starts_a_new_process", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_a_new_thread_and_returns_joinhandle_t", isCorrect: true),
                                    Answer(id: UUID(), title: "blocks_current_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_result", isCorrect: false)
                                ],
                                descriptionText: "spawn_accepts_a_closure_and_returns_a_handle_for_joining",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 3
                            Question(
                                id: UUID(),
                                title: "what_is_joinhandle_join_for",
                                answers: [
                                    Answer(id: UUID(), title: "to_kill_the_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "to_wait_for_thread_completion_and_get_result", isCorrect: true),
                                    Answer(id: UUID(), title: "to_detach_the_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "to_increase_thread_priority", isCorrect: false)
                                ],
                                descriptionText: "join_blocks_calling_thread_until_spawned_one_finishes",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 4
                            Question(
                                id: UUID(),
                                title: "what_happens_to_child_threads_if_main_thread_exits",
                                answers: [
                                    Answer(id: UUID(), title: "they_continue_running", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_takes_over_their_work", isCorrect: false),
                                    Answer(id: UUID(), title: "they_are_terminated_prematurely", isCorrect: true),
                                    Answer(id: UUID(), title: "nothing_behavior_is_undefined", isCorrect: false)
                                ],
                                descriptionText: "child_threads_terminate_when_main_exits",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 5
                            Question(
                                id: UUID(),
                                title: "why_is_the_move_keyword_often_used_in_closures_passed_to_spawn",
                                answers: [
                                    Answer(id: UUID(), title: "to_speed_up_execution", isCorrect: false),
                                    Answer(id: UUID(), title: "to_make_closure_capture_values_by_reference", isCorrect: false),
                                    Answer(id: UUID(), title: "to_make_closure_move_ownership_of_captured_values_into_thread", isCorrect: true),
                                    Answer(id: UUID(), title: "to_make_closure_fnmut", isCorrect: false)
                                ],
                                descriptionText: "move_transfers_ownership_to_thread",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 6
                            Question(
                                id: UUID(),
                                title: "why_might_code_using_borrows_from_outer_scope_without_move_not_compile",
                                answers: [
                                    Answer(id: UUID(), title: "compiler_doesnt_support_references_in_threads", isCorrect: false),
                                    Answer(id: UUID(), title: "static_is_required_for_data_used_by_thread", isCorrect: true),
                                    Answer(id: UUID(), title: "always_need_arc", isCorrect: false),
                                    Answer(id: UUID(), title: "references_are_forbidden_in_rust", isCorrect: false)
                                ],
                                descriptionText: "thread_can_outlive_current_scope_so_captured_data_must_be_static_or_moved_inside",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 7
                            Question(
                                id: UUID(),
                                title: "channels_std_sync_mpsc_are",
                                answers: [
                                    Answer(id: UUID(), title: "multiple_consumer_single_producer", isCorrect: false),
                                    Answer(id: UUID(), title: "single_consumer_multiple_producers", isCorrect: true),
                                    Answer(id: UUID(), title: "multiple_consumer_multiple_producer", isCorrect: false),
                                    Answer(id: UUID(), title: "only_single_producer_and_consumer", isCorrect: false)
                                ],
                                descriptionText: "mpsc_means_multiple_producer_single_consumer",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 8
                            Question(
                                id: UUID(),
                                title: "what_does_mpsc_channel_return",
                                answers: [
                                    Answer(id: UUID(), title: "sender_t_receiver_t", isCorrect: true),
                                    Answer(id: UUID(), title: "result_sender_t_receiver_t", isCorrect: false),
                                    Answer(id: UUID(), title: "arc_mutex_t", isCorrect: false),
                                    Answer(id: UUID(), title: "joinhandle_sender_t_receiver_t", isCorrect: false)
                                ],
                                descriptionText: "returns_tuple_of_sender_and_receiver",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 9
                            Question(
                                id: UUID(),
                                title: "what_does_sender_send_value_do_in_terms_of_ownership",
                                answers: [
                                    Answer(id: UUID(), title: "copies_the_value", isCorrect: false),
                                    Answer(id: UUID(), title: "moves_the_value_to_another_thread", isCorrect: true),
                                    Answer(id: UUID(), title: "borrows_the_value", isCorrect: false),
                                    Answer(id: UUID(), title: "none_of_these", isCorrect: false)
                                ],
                                descriptionText: "send_transfers_ownership",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 10
                            Question(
                                id: UUID(),
                                title: "how_does_recv_differ_from_try_recv_on_receiver",
                                answers: [
                                    Answer(id: UUID(), title: "recv_is_non_blocking_try_recv_is_blocking", isCorrect: false),
                                    Answer(id: UUID(), title: "both_block", isCorrect: false),
                                    Answer(id: UUID(), title: "recv_blocks_try_recv_returns_immediately", isCorrect: true),
                                    Answer(id: UUID(), title: "both_are_non_blocking", isCorrect: false)
                                ],
                                descriptionText: "recv_waits_try_recv_does_not",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 11
                            Question(
                                id: UUID(),
                                title: "can_you_have_multiple_senders_for_one_receiver",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_via_clone_of_sender", isCorrect: true),
                                    Answer(id: UUID(), title: "only_through_arc_sender", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_nightly", isCorrect: false)
                                ],
                                descriptionText: "sender_can_be_cloned_for_multiple_producers",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 12
                            Question(
                                id: UUID(),
                                title: "what_happens_when_sending_on_a_channel_if_receiver_is_already_closed",
                                answers: [
                                    Answer(id: UUID(), title: "blocks_forever", isCorrect: false),
                                    Answer(id: UUID(), title: "process_crashes", isCorrect: false),
                                    Answer(id: UUID(), title: "send_returns_error", isCorrect: true),
                                    Answer(id: UUID(), title: "message_is_lost_without_error", isCorrect: false)
                                ],
                                descriptionText: "send_fails_when_receiver_dropped",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 13
                            Question(
                                id: UUID(),
                                title: "how_does_the_message_passing_approach_slogan_sound",
                                answers: [
                                    Answer(id: UUID(), title: "communicate_by_sharing_memory", isCorrect: false),
                                    Answer(id: UUID(), title: "dont_share_memory_to_communicate_communicate_to_share_memory", isCorrect: true),
                                    Answer(id: UUID(), title: "use_global_variables", isCorrect: false),
                                    Answer(id: UUID(), title: "only_mutexes_only_hardcore", isCorrect: false)
                                ],
                                descriptionText: "rust_philosophy_on_concurrency",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 14
                            Question(
                                id: UUID(),
                                title: "what_is_mutex_t",
                                answers: [
                                    Answer(id: UUID(), title: "primitive_allowing_only_one_thread_to_own_t_at_any_moment", isCorrect: true),
                                    Answer(id: UUID(), title: "asynchronous_queue", isCorrect: false),
                                    Answer(id: UUID(), title: "atomic_counter", isCorrect: false),
                                    Answer(id: UUID(), title: "read_write_lock", isCorrect: false)
                                ],
                                descriptionText: "mutex_provides_mutual_exclusion",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 15
                            Question(
                                id: UUID(),
                                title: "what_does_mutex_lock_return_on_success",
                                answers: [
                                    Answer(id: UUID(), title: "ref_mut_t", isCorrect: false),
                                    Answer(id: UUID(), title: "mutexguard_t", isCorrect: true),
                                    Answer(id: UUID(), title: "arc_t", isCorrect: false),
                                    Answer(id: UUID(), title: "option_ref_mut_t", isCorrect: false)
                                ],
                                descriptionText: "mutexguard_implements_deref_derefmut_and_releases_lock_in_drop",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 16
                            Question(
                                id: UUID(),
                                title: "when_is_mutex_lock_released",
                                answers: [
                                    Answer(id: UUID(), title: "on_explicit_unlock", isCorrect: false),
                                    Answer(id: UUID(), title: "when_mutexguard_goes_out_of_scope_drop", isCorrect: true),
                                    Answer(id: UUID(), title: "on_calling_mem_drop_mutex", isCorrect: false),
                                    Answer(id: UUID(), title: "when_all_threads_finish", isCorrect: false)
                                ],
                                descriptionText: "lock_released_automatically_via_drop",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 17
                            Question(
                                id: UUID(),
                                title: "why_cant_rc_t_be_used_between_threads",
                                answers: [
                                    Answer(id: UUID(), title: "because_its_slow", isCorrect: false),
                                    Answer(id: UUID(), title: "because_rc_t_is_not_send", isCorrect: true),
                                    Answer(id: UUID(), title: "because_rc_t_is_not_clone", isCorrect: false),
                                    Answer(id: UUID(), title: "because_rc_t_is_not_sync_and_has_no_drop", isCorrect: false)
                                ],
                                descriptionText: "reference_count_modification_in_rc_is_not_thread_safe",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 18
                            Question(
                                id: UUID(),
                                title: "how_does_arc_t_differ_from_rc_t",
                                answers: [
                                    Answer(id: UUID(), title: "nothing", isCorrect: false),
                                    Answer(id: UUID(), title: "arc_t_is_thread_safe_atomic_counter_rc_t_is_not", isCorrect: true),
                                    Answer(id: UUID(), title: "arc_t_cannot_be_cloned", isCorrect: false),
                                    Answer(id: UUID(), title: "arc_t_is_slower_and_forbidden", isCorrect: false)
                                ],
                                descriptionText: "arc_uses_atomic_operations_for_thread_safety",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 19
                            Question(
                                id: UUID(),
                                title: "how_to_organize_many_owners_plus_mutation_in_multithreaded_code",
                                answers: [
                                    Answer(id: UUID(), title: "rc_t_plus_refcell_t", isCorrect: false),
                                    Answer(id: UUID(), title: "arc_t_plus_refcell_t", isCorrect: false),
                                    Answer(id: UUID(), title: "arc_t_plus_mutex_t", isCorrect: true),
                                    Answer(id: UUID(), title: "box_t_plus_mutex_t", isCorrect: false)
                                ],
                                descriptionText: "arc_for_sharing_mutex_for_safe_mutation",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 20
                            Question(
                                id: UUID(),
                                title: "what_logic_defect_is_common_with_mutex_t",
                                answers: [
                                    Answer(id: UUID(), title: "memory_leak_always", isCorrect: false),
                                    Answer(id: UUID(), title: "data_race", isCorrect: false),
                                    Answer(id: UUID(), title: "deadlock_mutual_blocking", isCorrect: true),
                                    Answer(id: UUID(), title: "impossible_to_compile", isCorrect: false)
                                ],
                                descriptionText: "mutexes_can_cause_deadlocks",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 21
                            Question(
                                id: UUID(),
                                title: "what_does_the_marker_trait_send_mean",
                                answers: [
                                    Answer(id: UUID(), title: "type_can_be_safely_passed_between_threads_by_reference", isCorrect: false),
                                    Answer(id: UUID(), title: "ownership_of_types_value_can_be_transferred_between_threads", isCorrect: true),
                                    Answer(id: UUID(), title: "type_is_thread_safe_for_concurrent_reading", isCorrect: false),
                                    Answer(id: UUID(), title: "type_cannot_be_passed_between_threads", isCorrect: false)
                                ],
                                descriptionText: "send_means_safe_to_move_between_threads",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 22
                            Question(
                                id: UUID(),
                                title: "what_does_the_marker_trait_sync_mean",
                                answers: [
                                    Answer(id: UUID(), title: "type_can_be_copied", isCorrect: false),
                                    Answer(id: UUID(), title: "type_can_be_moved", isCorrect: false),
                                    Answer(id: UUID(), title: "ref_t_can_be_safely_shared_between_threads", isCorrect: true),
                                    Answer(id: UUID(), title: "ref_mut_t_can_be_shared_between_threads", isCorrect: false)
                                ],
                                descriptionText: "sync_means_safe_to_share_references_between_threads",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 23
                            Question(
                                id: UUID(),
                                title: "is_send_sync_automatically_derived_implemented",
                                answers: [
                                    Answer(id: UUID(), title: "no_only_manually", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_all_component_types_are_also_send_sync", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_primitives", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_nightly", isCorrect: false)
                                ],
                                descriptionText: "send_sync_are_auto_traits",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 24
                            Question(
                                id: UUID(),
                                title: "can_send_sync_be_implemented_manually",
                                answers: [
                                    Answer(id: UUID(), title: "yes_its_always_safe", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_but_its_unsafe_and_requires_great_care", isCorrect: true),
                                    Answer(id: UUID(), title: "no_forbidden", isCorrect: false),
                                    Answer(id: UUID(), title: "only_send_can_be", isCorrect: false)
                                ],
                                descriptionText: "manual_implementation_requires_unsafe",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 25
                            Question(
                                id: UUID(),
                                title: "why_is_refcell_t_not_sync",
                                answers: [
                                    Answer(id: UUID(), title: "because_its_expensive", isCorrect: false),
                                    Answer(id: UUID(), title: "because_it_checks_borrows_at_runtime_which_is_not_thread_safe", isCorrect: true),
                                    Answer(id: UUID(), title: "because_it_has_no_drop", isCorrect: false),
                                    Answer(id: UUID(), title: "because_its_not_clone", isCorrect: false)
                                ],
                                descriptionText: "refcell_runtime_checks_are_not_thread_safe",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 26
                            Question(
                                id: UUID(),
                                title: "how_to_get_result_from_thread_launched_with_spawn",
                                answers: [
                                    Answer(id: UUID(), title: "global_variable", isCorrect: false),
                                    Answer(id: UUID(), title: "mpsc_channel", isCorrect: false),
                                    Answer(id: UUID(), title: "via_return_value_from_closure_and_join", isCorrect: true),
                                    Answer(id: UUID(), title: "no_way", isCorrect: false)
                                ],
                                descriptionText: "join_returns_result_of_closure",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 27
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_try_to_use_a_value_after_send_val",
                                answers: [
                                    Answer(id: UUID(), title: "compiles_and_copies_value", isCorrect: false),
                                    Answer(id: UUID(), title: "compilation_error_value_was_moved", isCorrect: true),
                                    Answer(id: UUID(), title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(), title: "ub", isCorrect: false)
                                ],
                                descriptionText: "send_moves_value_preventing_further_use",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 28
                            Question(
                                id: UUID(),
                                title: "why_does_output_order_from_threads_differ_between_runs",
                                answers: [
                                    Answer(id: UUID(), title: "due_to_undefined_behavior", isCorrect: false),
                                    Answer(id: UUID(), title: "due_to_os_scheduler_and_lack_of_execution_order_guarantees", isCorrect: true),
                                    Answer(id: UUID(), title: "due_to_println", isCorrect: false),
                                    Answer(id: UUID(), title: "designed_that_way_but_always_deterministic", isCorrect: false)
                                ],
                                descriptionText: "thread_scheduling_is_non_deterministic",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 29
                            Question(
                                id: UUID(),
                                title: "what_does_thread_sleep_duration_do",
                                answers: [
                                    Answer(id: UUID(), title: "blocks_all_process_threads", isCorrect: false),
                                    Answer(id: UUID(), title: "puts_current_thread_to_sleep_giving_others_a_chance", isCorrect: true),
                                    Answer(id: UUID(), title: "switches_context_to_specified_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "speeds_up_execution", isCorrect: false)
                                ],
                                descriptionText: "sleep_pauses_current_thread",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 30
                            Question(
                                id: UUID(),
                                title: "can_you_iterate_over_receiver_as_an_iterator",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_while_channel_is_not_closed", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_but_only_once", isCorrect: false),
                                    Answer(id: UUID(), title: "only_through_try_iter_in_nightly", isCorrect: false)
                                ],
                                descriptionText: "receiver_implements_iterator",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 31
                            Question(
                                id: UUID(),
                                title: "what_happens_if_join_is_called_before_main_thread_does_its_work",
                                answers: [
                                    Answer(id: UUID(), title: "nothing", isCorrect: false),
                                    Answer(id: UUID(), title: "there_will_be_interleaving", isCorrect: false),
                                    Answer(id: UUID(), title: "main_thread_waits_then_executes_its_work_no_interleaving", isCorrect: true),
                                    Answer(id: UUID(), title: "thread_exits_with_error", isCorrect: false)
                                ],
                                descriptionText: "join_blocks_until_thread_completes",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 32
                            Question(
                                id: UUID(),
                                title: "what_primitive_is_simpler_and_faster_for_simple_numeric_counters_in_multithreading",
                                answers: [
                                    Answer(id: UUID(), title: "arc_mutex_i32", isCorrect: false),
                                    Answer(id: UUID(), title: "std_sync_atomic_atomici32", isCorrect: true),
                                    Answer(id: UUID(), title: "rc_cell_i32", isCorrect: false),
                                    Answer(id: UUID(), title: "box_i32", isCorrect: false)
                                ],
                                descriptionText: "atomics_are_faster_for_simple_counters",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 33
                            Question(
                                id: UUID(),
                                title: "what_does_fearless_concurrency_mean_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "complete_absence_of_errors", isCorrect: false),
                                    Answer(id: UUID(), title: "concurrent_code_without_locks", isCorrect: false),
                                    Answer(id: UUID(), title: "most_concurrency_errors_become_compile_errors_thanks_to_ownership_system_and_types", isCorrect: true),
                                    Answer(id: UUID(), title: "universal_green_threads", isCorrect: false)
                                ],
                                descriptionText: "compile_time_guarantees_prevent_concurrency_bugs",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 34
                            Question(
                                id: UUID(),
                                title: "whats_the_key_difference_between_messaging_vs_shared_state",
                                answers: [
                                    Answer(id: UUID(), title: "messages_are_slower_shared_state_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "messages_transfer_ownership_shared_state_shares_memory_between_threads", isCorrect: true),
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "messages_require_unsafe", isCorrect: false)
                                ],
                                descriptionText: "two_paradigms_for_concurrency",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 35
                            Question(
                                id: UUID(),
                                title: "what_happens_if_thread_with_captured_mutexguard_panics",
                                answers: [
                                    Answer(id: UUID(), title: "lock_is_always_released_via_drop_of_mutexguard", isCorrect: true),
                                    Answer(id: UUID(), title: "lock_remains_forever", isCorrect: false),
                                    Answer(id: UUID(), title: "leak_occurs", isCorrect: false),
                                    Answer(id: UUID(), title: "ub", isCorrect: false)
                                ],
                                descriptionText: "drop_ensures_lock_release_even_on_panic",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 36
                            Question(
                                id: UUID(),
                                title: "is_it_true_arc_t_itself_provides_mutation_of_t",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no_need_additional_primitive_mutex_rwlock_for_safe_mutation", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_if_t_sync", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_if_t_send", isCorrect: false)
                                ],
                                descriptionText: "arc_only_provides_shared_ownership_not_mutation",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 37
                            Question(
                                id: UUID(),
                                title: "why_does_join_return_result_t_box_any_send_simplified",
                                answers: [
                                    Answer(id: UUID(), title: "to_return_lock_status", isCorrect: false),
                                    Answer(id: UUID(), title: "to_signal_panic_in_child_thread", isCorrect: true),
                                    Answer(id: UUID(), title: "to_return_sender", isCorrect: false),
                                    Answer(id: UUID(), title: "to_convert_to_option", isCorrect: false)
                                ],
                                descriptionText: "join_propagates_panics_from_child_thread",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 38
                            Question(
                                id: UUID(),
                                title: "can_you_use_move_closure_and_then_use_the_moved_variable_in_main_thread",
                                answers: [
                                    Answer(id: UUID(), title: "yes", isCorrect: false),
                                    Answer(id: UUID(), title: "no_variable_was_moved_use_leads_to_compilation_error", isCorrect: true),
                                    Answer(id: UUID(), title: "yes_but_only_if_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_but_only_through_unsafe", isCorrect: false)
                                ],
                                descriptionText: "move_transfers_ownership_permanently",
                                descriptionLink: "fearless_concurrency_link"
                            ),
                            
                            // Question 39
                            Question(
                                id: UUID(),
                                title: "why_is_mutex_t_also_considered_an_implementation_of_interior_mutability",
                                answers: [
                                    Answer(id: UUID(), title: "because_mutex_t_is_always_mut", isCorrect: false),
                                    Answer(id: UUID(), title: "because_it_allows_changing_t_through_immutable_wrapper_arc_mutex_t_while_following_locking_protocol", isCorrect: true),
                                    Answer(id: UUID(), title: "because_it_uses_refcell", isCorrect: false),
                                    Answer(id: UUID(), title: "because_it_implements_copy", isCorrect: false)
                                ],
                                descriptionText: "mutex_provides_interior_mutability_through_locking",
                                descriptionLink: "fearless_concurrency_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "async_fundamentals",
                        priority: 13,
                        questions: [
                            // 1
                            Question(
                                id: UUID(),
                                title: "what_is_a_future_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "function_runs_immediately", isCorrect: false),
                                    Answer(id: UUID(), title: "value_ready_in_future", isCorrect: true),
                                    Answer(id: UUID(), title: "date_time_datatype", isCorrect: false),
                                    Answer(id: UUID(), title: "synonym_for_thread", isCorrect: false)
                                ],
                                descriptionText: "future_represents_value_becoming_available_later",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 2
                            Question(
                                id: UUID(),
                                title: "keyword_for_async_function",
                                answers: [
                                    Answer(id: UUID(), title: "future_kw", isCorrect: false),
                                    Answer(id: UUID(), title: "await_kw", isCorrect: false),
                                    Answer(id: UUID(), title: "async_kw", isCorrect: true),
                                    Answer(id: UUID(), title: "defer_kw", isCorrect: false)
                                ],
                                descriptionText: "async_before_fn_or_block_makes_it_async",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 3
                            Question(
                                id: UUID(),
                                title: "what_does_await_do",
                                answers: [
                                    Answer(id: UUID(), title: "blocks_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "suspends_future_yields_to_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "deletes_future", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_new_thread", isCorrect: false)
                                ],
                                descriptionText: "await_pauses_and_allows_runtime_to_schedule_others",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 4
                            Question(
                                id: UUID(),
                                title: "parallelism_vs_concurrency",
                                answers: [
                                    Answer(id: UUID(), title: "parallelism_on_cores_concurrency_switching", isCorrect: true),
                                    Answer(id: UUID(), title: "they_are_synonyms", isCorrect: false),
                                    Answer(id: UUID(), title: "parallelism_only_with_async", isCorrect: false),
                                    Answer(id: UUID(), title: "concurrency_requires_multithreading", isCorrect: false)
                                ],
                                descriptionText: "parallelism_is_simultaneous_concurrency_is_interleaving",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 5
                            Question(
                                id: UUID(),
                                title: "future_trait_readiness_method",
                                answers: [
                                    Answer(id: UUID(), title: "check", isCorrect: false),
                                    Answer(id: UUID(), title: "ready", isCorrect: false),
                                    Answer(id: UUID(), title: "poll", isCorrect: true),
                                    Answer(id: UUID(), title: "await_method", isCorrect: false)
                                ],
                                descriptionText: "poll_returns_ready_or_pending",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 6
                            Question(
                                id: UUID(),
                                title: "poll_return_type_for_future",
                                answers: [
                                    Answer(id: UUID(), title: "bool_type", isCorrect: false),
                                    Answer(id: UUID(), title: "option_of_t", isCorrect: false),
                                    Answer(id: UUID(), title: "poll_of_self_output", isCorrect: true),
                                    Answer(id: UUID(), title: "result_t_e", isCorrect: false)
                                ],
                                descriptionText: "poll_returns_poll_self_output_ready_or_pending",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 7
                            Question(
                                id: UUID(),
                                title: "are_futures_lazy",
                                answers: [
                                    Answer(id: UUID(), title: "not_lazy_run_immediately", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_do_nothing_until_await", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_explicit", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_runtime", isCorrect: false)
                                ],
                                descriptionText: "futures_progress_only_when_polled_or_awaited",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 8
                            Question(
                                id: UUID(),
                                title: "what_is_async_runtime",
                                answers: [
                                    Answer(id: UUID(), title: "rust_compiler", isCorrect: false),
                                    Answer(id: UUID(), title: "library_coordinating_async_code", isCorrect: true),
                                    Answer(id: UUID(), title: "operating_system", isCorrect: false),
                                    Answer(id: UUID(), title: "data_type", isCorrect: false)
                                ],
                                descriptionText: "runtime_schedules_tasks_provides_async_io",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 9
                            Question(
                                id: UUID(),
                                title: "why_main_not_async_by_default",
                                answers: [
                                    Answer(id: UUID(), title: "forbidden_by_syntax", isCorrect: false),
                                    Answer(id: UUID(), title: "main_initializes_runtime_not_part_of_it", isCorrect: true),
                                    Answer(id: UUID(), title: "async_cannot_return_values", isCorrect: false),
                                    Answer(id: UUID(), title: "os_limitation", isCorrect: false)
                                ],
                                descriptionText: "main_sets_up_runtime_that_runs_async_code",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 10
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_run_do",
                                answers: [
                                    Answer(id: UUID(), title: "compiles_async_code", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_new_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "runs_future_to_completion_with_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "converts_async_to_sync", isCorrect: false)
                                ],
                                descriptionText: "trpl_run_configures_runtime_and_executes_future",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 11
                            Question(
                                id: UUID(),
                                title: "position_of_await",
                                answers: [
                                    Answer(id: UUID(), title: "prefix_before_expression", isCorrect: false),
                                    Answer(id: UUID(), title: "postfix_after_expression", isCorrect: true),
                                    Answer(id: UUID(), title: "anywhere", isCorrect: false),
                                    Answer(id: UUID(), title: "must_be_on_separate_line", isCorrect: false)
                                ],
                                descriptionText: "await_is_postfix_future_dot_await",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 12
                            Question(
                                id: UUID(),
                                title: "compilation_of_async_block",
                                answers: [
                                    Answer(id: UUID(), title: "removed_from_code", isCorrect: false),
                                    Answer(id: UUID(), title: "anonymous_future_type_created", isCorrect: true),
                                    Answer(id: UUID(), title: "becomes_regular_function", isCorrect: false),
                                    Answer(id: UUID(), title: "generates_new_thread", isCorrect: false)
                                ],
                                descriptionText: "compiler_generates_state_machine_implementing_future",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 13
                            Question(
                                id: UUID(),
                                title: "async_fn_return_type",
                                answers: [
                                    Answer(id: UUID(), title: "returns_t", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_future_t", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_impl_future_output_t", isCorrect: true),
                                    Answer(id: UUID(), title: "returns_task_t", isCorrect: false)
                                ],
                                descriptionText: "async_fn_returns_impl_future_with_output_t",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 14
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_race_do",
                                answers: [
                                    Answer(id: UUID(), title: "runs_futures_in_parallel", isCorrect: false),
                                    Answer(id: UUID(), title: "returns_first_completed_future_result", isCorrect: true),
                                    Answer(id: UUID(), title: "cancels_others", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_speed", isCorrect: false)
                                ],
                                descriptionText: "race_resolves_with_whichever_future_finishes_first",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 15
                            Question(
                                id: UUID(),
                                title: "trpl_race_return_type",
                                answers: [
                                    Answer(id: UUID(), title: "result_t_e", isCorrect: false),
                                    Answer(id: UUID(), title: "option_t", isCorrect: false),
                                    Answer(id: UUID(), title: "either_a_b", isCorrect: true),
                                    Answer(id: UUID(), title: "tuple_a_b", isCorrect: false)
                                ],
                                descriptionText: "race_returns_either_left_or_right_based_on_winner",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 16
                            Question(
                                id: UUID(),
                                title: "what_is_await_point",
                                answers: [
                                    Answer(id: UUID(), title: "program_end", isCorrect: false),
                                    Answer(id: UUID(), title: "suspension_and_resumption_point", isCorrect: true),
                                    Answer(id: UUID(), title: "async_entry_point", isCorrect: false),
                                    Answer(id: UUID(), title: "future_creation_point", isCorrect: false)
                                ],
                                descriptionText: "await_points_allow_runtime_to_switch_tasks",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 17
                            Question(
                                id: UUID(),
                                title: "state_machine_in_async",
                                answers: [
                                    Answer(id: UUID(), title: "physical_device", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_generated_state_tracker", isCorrect: true),
                                    Answer(id: UUID(), title: "database_type", isCorrect: false),
                                    Answer(id: UUID(), title: "sorting_algorithm", isCorrect: false)
                                ],
                                descriptionText: "async_code_is_transformed_into_state_machine",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 18
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_spawn_task_do",
                                answers: [
                                    Answer(id: UUID(), title: "create_os_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "spawn_runtime_task", isCorrect: true),
                                    Answer(id: UUID(), title: "block_current_task", isCorrect: false),
                                    Answer(id: UUID(), title: "delete_task", isCorrect: false)
                                ],
                                descriptionText: "spawn_task_creates_runtime_managed_task",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 19
                            Question(
                                id: UUID(),
                                title: "spawn_task_return_value",
                                answers: [
                                    Answer(id: UUID(), title: "future_value", isCorrect: false),
                                    Answer(id: UUID(), title: "thread_handle", isCorrect: false),
                                    Answer(id: UUID(), title: "join_handle", isCorrect: true),
                                    Answer(id: UUID(), title: "task_id", isCorrect: false)
                                ],
                                descriptionText: "join_handle_can_be_awaited_for_result",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 20
                            Question(
                                id: UUID(),
                                title: "trpl_sleep_vs_thread_sleep",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "trpl_sleep_is_async_future", isCorrect: true),
                                    Answer(id: UUID(), title: "trpl_sleep_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "thread_sleep_only_in_async", isCorrect: false)
                                ],
                                descriptionText: "async_sleep_does_not_block_thread_must_await",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 21
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_join_do",
                                answers: [
                                    Answer(id: UUID(), title: "join_two_threads", isCorrect: false),
                                    Answer(id: UUID(), title: "await_both_and_return_tuple", isCorrect: true),
                                    Answer(id: UUID(), title: "merge_into_one_future", isCorrect: false),
                                    Answer(id: UUID(), title: "cancel_futures", isCorrect: false)
                                ],
                                descriptionText: "join_waits_for_all_and_returns_both_results",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 22
                            Question(
                                id: UUID(),
                                title: "is_trpl_join_fair",
                                answers: [
                                    Answer(id: UUID(), title: "no_polls_in_argument_order", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_alternates_polling", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "fairness_not_applicable", isCorrect: false)
                                ],
                                descriptionText: "join_alternates_polling_to_prevent_starvation",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 23
                            Question(
                                id: UUID(),
                                title: "what_is_async_channel",
                                answers: [
                                    Answer(id: UUID(), title: "regular_thread_channel", isCorrect: false),
                                    Answer(id: UUID(), title: "channel_for_async_message_passing", isCorrect: true),
                                    Answer(id: UUID(), title: "network_connection", isCorrect: false),
                                    Answer(id: UUID(), title: "storage_datatype", isCorrect: false)
                                ],
                                descriptionText: "async_channel_allows_message_passing_between_futures",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 24
                            Question(
                                id: UUID(),
                                title: "async_recv_vs_sync_recv",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference_between_them", isCorrect: false),
                                    Answer(id: UUID(), title: "async_recv_returns_future_to_await", isCorrect: true),
                                    Answer(id: UUID(), title: "async_recv_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "sync_recv_does_not_exist", isCorrect: false)
                                ],
                                descriptionText: "async_recv_is_nonblocking_and_yields_future",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 25
                            Question(
                                id: UUID(),
                                title: "why_use_async_move",
                                answers: [
                                    Answer(id: UUID(), title: "for_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "transfer_ownership_of_captured_values", isCorrect: true),
                                    Answer(id: UUID(), title: "required_for_all_async_blocks", isCorrect: false),
                                    Answer(id: UUID(), title: "to_create_new_thread", isCorrect: false)
                                ],
                                descriptionText: "async_move_captures_by_value_like_closures",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 26
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_join_macro_do",
                                answers: [
                                    Answer(id: UUID(), title: "accepts_only_two_futures", isCorrect: false),
                                    Answer(id: UUID(), title: "accepts_arbitrary_number_of_futures", isCorrect: true),
                                    Answer(id: UUID(), title: "works_with_one_type_only", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_new_futures", isCorrect: false)
                                ],
                                descriptionText: "join_macro_can_take_any_number_of_futures",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 27
                            Question(
                                id: UUID(),
                                title: "what_does_trpl_join_all_do",
                                answers: [
                                    Answer(id: UUID(), title: "waits_for_all_futures_in_collection", isCorrect: true),
                                    Answer(id: UUID(), title: "combines_futures_into_one", isCorrect: false),
                                    Answer(id: UUID(), title: "cancels_all_futures", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_future_types", isCorrect: false)
                                ],
                                descriptionText: "join_all_completes_when_all_futures_finish",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 28
                            Question(
                                id: UUID(),
                                title: "join_all_future_requirements",
                                answers: [
                                    Answer(id: UUID(), title: "must_be_different_types", isCorrect: false),
                                    Answer(id: UUID(), title: "must_be_same_type", isCorrect: true),
                                    Answer(id: UUID(), title: "must_finish_simultaneously", isCorrect: false),
                                    Answer(id: UUID(), title: "must_not_be_pinned", isCorrect: false)
                                ],
                                descriptionText: "join_all_requires_uniform_output_types",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 29
                            Question(
                                id: UUID(),
                                title: "trait_object_in_async_context",
                                answers: [
                                    Answer(id: UUID(), title: "oop_class", isCorrect: false),
                                    Answer(id: UUID(), title: "dynamic_type_via_common_trait", isCorrect: true),
                                    Answer(id: UUID(), title: "asynchronous_object", isCorrect: false),
                                    Answer(id: UUID(), title: "function_pointer", isCorrect: false)
                                ],
                                descriptionText: "dyn_trait_enables_heterogeneous_types_via_interface",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 30
                            Question(
                                id: UUID(),
                                title: "why_pin_is_needed",
                                answers: [
                                    Answer(id: UUID(), title: "to_speed_up_code", isCorrect: false),
                                    Answer(id: UUID(), title: "guarantee_value_not_moved_in_memory", isCorrect: true),
                                    Answer(id: UUID(), title: "to_create_pointers", isCorrect: false),
                                    Answer(id: UUID(), title: "deprecated_feature", isCorrect: false)
                                ],
                                descriptionText: "pin_protects_self_referential_structures_used_by_futures",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 31
                            Question(
                                id: UUID(),
                                title: "what_is_unpin_trait",
                                answers: [
                                    Answer(id: UUID(), title: "opposite_of_pin", isCorrect: false),
                                    Answer(id: UUID(), title: "marker_safe_to_move_even_when_pinned", isCorrect: true),
                                    Answer(id: UUID(), title: "trait_to_remove_pin", isCorrect: false),
                                    Answer(id: UUID(), title: "alternative_to_future", isCorrect: false)
                                ],
                                descriptionText: "unpin_indicates_type_is_safe_to_move",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 32
                            Question(
                                id: UUID(),
                                title: "do_most_types_implement_unpin_automatically",
                                answers: [
                                    Answer(id: UUID(), title: "no_manual_impl_required", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_except_special_cases", isCorrect: true),
                                    Answer(id: UUID(), title: "only_primitive_types", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_runtime", isCorrect: false)
                                ],
                                descriptionText: "compiler_auto_derives_unpin_when_safe",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 33
                            Question(
                                id: UUID(),
                                title: "when_to_use_box_pin",
                                answers: [
                                    Answer(id: UUID(), title: "always_for_futures", isCorrect: false),
                                    Answer(id: UUID(), title: "when_need_pinned_future_on_heap", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_large_structs", isCorrect: false),
                                    Answer(id: UUID(), title: "never_obsolete", isCorrect: false)
                                ],
                                descriptionText: "box_pin_creates_pinned_heap_allocation_for_dynamic_futures",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 34
                            Question(
                                id: UUID(),
                                title: "what_is_stream_in_async_rust",
                                answers: [
                                    Answer(id: UUID(), title: "network_connection", isCorrect: false),
                                    Answer(id: UUID(), title: "asynchronous_iterator", isCorrect: true),
                                    Answer(id: UUID(), title: "data_flow_type", isCorrect: false),
                                    Answer(id: UUID(), title: "alternative_to_future", isCorrect: false)
                                ],
                                descriptionText: "stream_is_async_counterpart_of_iterator",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 35
                            Question(
                                id: UUID(),
                                title: "stream_trait_core_method",
                                answers: [
                                    Answer(id: UUID(), title: "next", isCorrect: false),
                                    Answer(id: UUID(), title: "poll", isCorrect: false),
                                    Answer(id: UUID(), title: "poll_next", isCorrect: true),
                                    Answer(id: UUID(), title: "stream_method", isCorrect: false)
                                ],
                                descriptionText: "poll_next_combines_future_poll_and_iterator_next",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 36
                            Question(
                                id: UUID(),
                                title: "poll_next_return_type",
                                answers: [
                                    Answer(id: UUID(), title: "option_t", isCorrect: false),
                                    Answer(id: UUID(), title: "poll_t", isCorrect: false),
                                    Answer(id: UUID(), title: "poll_option_t", isCorrect: true),
                                    Answer(id: UUID(), title: "result_t_e", isCorrect: false)
                                ],
                                descriptionText: "poll_next_returns_poll_option_t_for_readiness_and_sequence",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 37
                            Question(
                                id: UUID(),
                                title: "what_is_streamext",
                                answers: [
                                    Answer(id: UUID(), title: "file_extension", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_with_utility_methods_for_stream", isCorrect: true),
                                    Answer(id: UUID(), title: "alternative_stream_impl", isCorrect: false),
                                    Answer(id: UUID(), title: "data_type_kind", isCorrect: false)
                                ],
                                descriptionText: "streamext_adds_helpers_like_next_filter_map",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 38
                            Question(
                                id: UUID(),
                                title: "timeout_on_stream",
                                answers: [
                                    Answer(id: UUID(), title: "stop_stream", isCorrect: false),
                                    Answer(id: UUID(), title: "set_time_limit_per_item", isCorrect: true),
                                    Answer(id: UUID(), title: "speed_up_stream", isCorrect: false),
                                    Answer(id: UUID(), title: "create_timer", isCorrect: false)
                                ],
                                descriptionText: "timeout_wraps_stream_and_errors_if_item_is_late",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 39
                            Question(
                                id: UUID(),
                                title: "throttle_on_stream",
                                answers: [
                                    Answer(id: UUID(), title: "increase_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "limit_polling_rate", isCorrect: true),
                                    Answer(id: UUID(), title: "stop_stream", isCorrect: false),
                                    Answer(id: UUID(), title: "filter_items", isCorrect: false)
                                ],
                                descriptionText: "throttle_controls_how_often_stream_is_polled",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 40
                            Question(
                                id: UUID(),
                                title: "merge_streams_behavior",
                                answers: [
                                    Answer(id: UUID(), title: "combine_into_single_item", isCorrect: false),
                                    Answer(id: UUID(), title: "combine_multiple_streams_yield_as_ready", isCorrect: true),
                                    Answer(id: UUID(), title: "remove_duplicates", isCorrect: false),
                                    Answer(id: UUID(), title: "sort_items", isCorrect: false)
                                ],
                                descriptionText: "merge_emits_items_from_several_sources_as_they_arrive",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 41
                            Question(
                                id: UUID(),
                                title: "take_on_stream",
                                answers: [
                                    Answer(id: UUID(), title: "remove_items", isCorrect: false),
                                    Answer(id: UUID(), title: "limit_number_of_items", isCorrect: true),
                                    Answer(id: UUID(), title: "capture_ownership", isCorrect: false),
                                    Answer(id: UUID(), title: "create_copy", isCorrect: false)
                                ],
                                descriptionText: "take_n_yields_at_most_n_items",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 42
                            Question(
                                id: UUID(),
                                title: "what_is_yield_now",
                                answers: [
                                    Answer(id: UUID(), title: "return_value_from_function", isCorrect: false),
                                    Answer(id: UUID(), title: "explicitly_yield_to_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "create_new_task", isCorrect: false),
                                    Answer(id: UUID(), title: "stop_program", isCorrect: false)
                                ],
                                descriptionText: "yield_now_inserts_await_point_without_real_wait",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 43
                            Question(
                                id: UUID(),
                                title: "cpu_bound_vs_io_bound",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "cpu_bound_limited_by_compute_io_bound_by_io", isCorrect: true),
                                    Answer(id: UUID(), title: "cpu_bound_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "io_bound_requires_more_memory", isCorrect: false)
                                ],
                                descriptionText: "cpu_bound_saturates_cpu_io_bound_waits_on_io",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 44
                            Question(
                                id: UUID(),
                                title: "is_async_useful_for_cpu_bound",
                                answers: [
                                    Answer(id: UUID(), title: "no_only_for_io_bound", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_for_structuring_program_relations", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_multithreading", isCorrect: false),
                                    Answer(id: UUID(), title: "never_useful", isCorrect: false)
                                ],
                                descriptionText: "async_helps_structure_cooperative_multitasking",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 45
                            Question(
                                id: UUID(),
                                title: "what_is_task_in_async_rust",
                                answers: [
                                    Answer(id: UUID(), title: "same_as_thread", isCorrect: false),
                                    Answer(id: UUID(), title: "unit_of_concurrency_managed_by_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "synonym_for_future", isCorrect: false),
                                    Answer(id: UUID(), title: "data_type", isCorrect: false)
                                ],
                                descriptionText: "task_is_lightweight_and_runtime_scheduled",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 46
                            Question(
                                id: UUID(),
                                title: "can_tasks_move_between_threads",
                                answers: [
                                    Answer(id: UUID(), title: "never_move", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_work_stealing_supported", isCorrect: true),
                                    Answer(id: UUID(), title: "only_manually", isCorrect: false),
                                    Answer(id: UUID(), title: "forbidden", isCorrect: false)
                                ],
                                descriptionText: "many_runtimes_rebalance_tasks_across_threads",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 47
                            Question(
                                id: UUID(),
                                title: "when_threads_are_preferable",
                                answers: [
                                    Answer(id: UUID(), title: "never_prefer_threads", isCorrect: false),
                                    Answer(id: UUID(), title: "for_highly_parallelizable_work", isCorrect: true),
                                    Answer(id: UUID(), title: "for_network_io", isCorrect: false),
                                    Answer(id: UUID(), title: "for_guis", isCorrect: false)
                                ],
                                descriptionText: "threads_fit_compute_heavy_parallel_workloads",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 48
                            Question(
                                id: UUID(),
                                title: "when_async_is_preferable",
                                answers: [
                                    Answer(id: UUID(), title: "always_prefer_async", isCorrect: false),
                                    Answer(id: UUID(), title: "for_high_concurrency_many_sources", isCorrect: true),
                                    Answer(id: UUID(), title: "for_math_heavy_computation", isCorrect: false),
                                    Answer(id: UUID(), title: "for_file_io", isCorrect: false)
                                ],
                                descriptionText: "async_excels_at_many_concurrent_events",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 49
                            Question(
                                id: UUID(),
                                title: "combine_threads_and_async",
                                answers: [
                                    Answer(id: UUID(), title: "cannot_be_combined", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_they_complement_each_other", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_special_runtime", isCorrect: false),
                                    Answer(id: UUID(), title: "deprecated_approach", isCorrect: false)
                                ],
                                descriptionText: "mix_threads_and_async_to_leverage_strengths",
                                descriptionLink: "async_fundamentals_link"
                            ),
                            // 50
                            Question(
                                id: UUID(),
                                title: "what_is_work_stealing_in_runtime",
                                answers: [
                                    Answer(id: UUID(), title: "stealing_data_between_tasks", isCorrect: false),
                                    Answer(id: UUID(), title: "load_balancing_moves_tasks_between_threads", isCorrect: true),
                                    Answer(id: UUID(), title: "attack_type", isCorrect: false),
                                    Answer(id: UUID(), title: "task_cancellation_method", isCorrect: false)
                                ],
                                descriptionText: "work_stealing_redistributes_tasks_to_optimize_load",
                                descriptionLink: "async_fundamentals_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "oop_in_rust",
                        priority: 14,
                        questions: [
                            // 1
                            Question(
                                id: UUID(),
                                title: "what_is_an_object_gang_of_four",
                                answers: [
                                    Answer(id: UUID(), title: "only_data", isCorrect: false),
                                    Answer(id: UUID(), title: "only_methods", isCorrect: false),
                                    Answer(id: UUID(), title: "package_of_data_and_procedures", isCorrect: true),
                                    Answer(id: UUID(), title: "class_with_inheritance", isCorrect: false)
                                ],
                                descriptionText: "object_combines_data_and_operations_on_that_data",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 2
                            Question(
                                id: UUID(),
                                title: "are_struct_and_enum_objects_by_gof",
                                answers: [
                                    Answer(id: UUID(), title: "no_they_are_not_objects", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_same_functionality_via_impl_methods", isCorrect: true),
                                    Answer(id: UUID(), title: "only_struct_are_objects", isCorrect: false),
                                    Answer(id: UUID(), title: "only_enum_are_objects", isCorrect: false)
                                ],
                                descriptionText: "struct_and_enum_with_impl_methods_provide_object_like_behavior",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 3
                            Question(
                                id: UUID(),
                                title: "what_is_encapsulation",
                                answers: [
                                    Answer(id: UUID(), title: "data_inheritance", isCorrect: false),
                                    Answer(id: UUID(), title: "hiding_implementation_details", isCorrect: true),
                                    Answer(id: UUID(), title: "polymorphism", isCorrect: false),
                                    Answer(id: UUID(), title: "dynamic_dispatch", isCorrect: false)
                                ],
                                descriptionText: "encapsulation_means_consumers_cannot_access_internal_details",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 4
                            Question(
                                id: UUID(),
                                title: "how_is_encapsulation_controlled_in_rust",
                                answers: [
                                    Answer(id: UUID(), title: "through_classes", isCorrect: false),
                                    Answer(id: UUID(), title: "through_pub_keyword", isCorrect: true),
                                    Answer(id: UUID(), title: "through_inheritance", isCorrect: false),
                                    Answer(id: UUID(), title: "automatically", isCorrect: false)
                                ],
                                descriptionText: "pub_defines_visibility_by_default_everything_is_private",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 5
                            Question(
                                id: UUID(),
                                title: "which_fields_private_in_averagedcollection",
                                answers: [
                                    Answer(id: UUID(), title: "only_list", isCorrect: false),
                                    Answer(id: UUID(), title: "only_average", isCorrect: false),
                                    Answer(id: UUID(), title: "list_and_average", isCorrect: true),
                                    Answer(id: UUID(), title: "all_fields_public", isCorrect: false)
                                ],
                                descriptionText: "both_list_and_average_are_private_to_preserve_invariants",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 6
                            Question(
                                id: UUID(),
                                title: "why_update_average_is_private",
                                answers: [
                                    Answer(id: UUID(), title: "for_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "internal_implementation_detail", isCorrect: true),
                                    Answer(id: UUID(), title: "compiler_limitation", isCorrect: false),
                                    Answer(id: UUID(), title: "to_avoid_type_errors", isCorrect: false)
                                ],
                                descriptionText: "helper_method_not_part_of_public_api",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 7
                            Question(
                                id: UUID(),
                                title: "does_rust_support_traditional_inheritance",
                                answers: [
                                    Answer(id: UUID(), title: "yes_fully", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_struct", isCorrect: false),
                                    Answer(id: UUID(), title: "only_via_macros", isCorrect: false)
                                ],
                                descriptionText: "no_inheritance_of_fields_methods_between_structs_in_rust",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 8
                            Question(
                                id: UUID(),
                                title: "how_to_reuse_code_instead_of_inheritance",
                                answers: [
                                    Answer(id: UUID(), title: "by_copying_code", isCorrect: false),
                                    Answer(id: UUID(), title: "via_default_trait_method_impls", isCorrect: true),
                                    Answer(id: UUID(), title: "via_macros_only", isCorrect: false),
                                    Answer(id: UUID(), title: "via_global_functions", isCorrect: false)
                                ],
                                descriptionText: "traits_with_default_methods_enable_code_reuse",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 9
                            Question(
                                id: UUID(),
                                title: "what_is_polymorphism",
                                answers: [
                                    Answer(id: UUID(), title: "multiple_inheritance", isCorrect: false),
                                    Answer(id: UUID(), title: "code_that_works_for_multiple_types", isCorrect: true),
                                    Answer(id: UUID(), title: "dynamic_typing", isCorrect: false),
                                    Answer(id: UUID(), title: "encapsulation_feature", isCorrect: false)
                                ],
                                descriptionText: "write_generic_code_applicable_to_various_types",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 10
                            Question(
                                id: UUID(),
                                title: "how_rust_implements_polymorphism",
                                answers: [
                                    Answer(id: UUID(), title: "via_inheritance", isCorrect: false),
                                    Answer(id: UUID(), title: "via_generics_and_trait_bounds", isCorrect: true),
                                    Answer(id: UUID(), title: "via_classes", isCorrect: false),
                                    Answer(id: UUID(), title: "via_interfaces_keyword", isCorrect: false)
                                ],
                                descriptionText: "generics_provide_abstraction_trait_bounds_provide_constraints",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 11
                            Question(
                                id: UUID(),
                                title: "what_is_a_trait_object",
                                answers: [
                                    Answer(id: UUID(), title: "instance_of_struct", isCorrect: false),
                                    Answer(id: UUID(), title: "pointer_plus_vtable_for_trait_methods", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_type", isCorrect: false),
                                    Answer(id: UUID(), title: "enum_variant", isCorrect: false)
                                ],
                                descriptionText: "trait_object_holds_pointer_to_value_and_method_table_vtable",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 12
                            Question(
                                id: UUID(),
                                title: "how_to_create_trait_object",
                                answers: [
                                    Answer(id: UUID(), title: "only_through_box_t", isCorrect: false),
                                    Answer(id: UUID(), title: "pointer_plus_dyn_plus_trait", isCorrect: true),
                                    Answer(id: UUID(), title: "through_impl_keyword", isCorrect: false),
                                    Answer(id: UUID(), title: "through_new_keyword", isCorrect: false)
                                ],
                                descriptionText: "use_box_or_ref_with_dyn_trait_to_make_trait_object",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 13
                            Question(
                                id: UUID(),
                                title: "what_does_box_dyn_draw_mean",
                                answers: [
                                    Answer(id: UUID(), title: "generic_type", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_object_for_any_type_implementing_draw", isCorrect: true),
                                    Answer(id: UUID(), title: "concrete_type_draw", isCorrect: false),
                                    Answer(id: UUID(), title: "abstract_class", isCorrect: false)
                                ],
                                descriptionText: "boxed_trait_object_erases_concrete_type_but_keeps_behavior",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 14
                            Question(
                                id: UUID(),
                                title: "generic_bound_vs_trait_object",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "generic_one_concrete_type_trait_object_many_at_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_is_slower", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_object_only_with_box", isCorrect: false)
                                ],
                                descriptionText: "generics_monomorphize_single_type_trait_objects_allow_heterogeneity",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 15
                            Question(
                                id: UUID(),
                                title: "what_is_duck_typing",
                                answers: [
                                    Answer(id: UUID(), title: "duck_type_in_program", isCorrect: false),
                                    Answer(id: UUID(), title: "behavior_based_type_checking", isCorrect: true),
                                    Answer(id: UUID(), title: "dynamic_typing_only", isCorrect: false),
                                    Answer(id: UUID(), title: "static_typing", isCorrect: false)
                                ],
                                descriptionText: "if_it_quacks_like_a_duck_behavior_defines_compatibility",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 16
                            Question(
                                id: UUID(),
                                title: "what_is_static_dispatch",
                                answers: [
                                    Answer(id: UUID(), title: "method_unknown_at_compile_time", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_knows_called_method_at_compile_time", isCorrect: true),
                                    Answer(id: UUID(), title: "runtime_determines_method", isCorrect: false),
                                    Answer(id: UUID(), title: "same_as_dynamic_dispatch", isCorrect: false)
                                ],
                                descriptionText: "static_dispatch_enables_inlining_and_optimizations",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 17
                            Question(
                                id: UUID(),
                                title: "what_is_dynamic_dispatch",
                                answers: [
                                    Answer(id: UUID(), title: "compiler_knows_method_at_compile_time", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_selects_method_via_trait_object", isCorrect: true),
                                    Answer(id: UUID(), title: "static_dispatch", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_generics", isCorrect: false)
                                ],
                                descriptionText: "vtable_lookup_at_runtime_for_trait_object_calls",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 18
                            Question(
                                id: UUID(),
                                title: "disadvantage_of_dynamic_dispatch",
                                answers: [
                                    Answer(id: UUID(), title: "uses_more_memory", isCorrect: false),
                                    Answer(id: UUID(), title: "runtime_overhead_and_fewer_optimizations", isCorrect: true),
                                    Answer(id: UUID(), title: "always_slower_than_static", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_be_used", isCorrect: false)
                                ],
                                descriptionText: "dynamic_dispatch_prevents_inlining_and_adds_indirection_cost",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 19
                            Question(
                                id: UUID(),
                                title: "what_is_state_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "memory_management_pattern", isCorrect: false),
                                    Answer(id: UUID(), title: "object_behavior_changes_by_internal_state", isCorrect: true),
                                    Answer(id: UUID(), title: "multithreading_pattern", isCorrect: false),
                                    Answer(id: UUID(), title: "database_pattern", isCorrect: false)
                                ],
                                descriptionText: "state_pattern_switches_behavior_depending_on_state_object",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 20
                            Question(
                                id: UUID(),
                                title: "why_post_uses_option_box_dyn_state",
                                answers: [
                                    Answer(id: UUID(), title: "for_performance", isCorrect: false),
                                    Answer(id: UUID(), title: "to_use_take_and_move_state_out", isCorrect: true),
                                    Answer(id: UUID(), title: "for_type_safety", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_requirement", isCorrect: false)
                                ],
                                descriptionText: "option_allows_take_to_replace_some_with_none_during_transitions",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 21
                            Question(
                                id: UUID(),
                                title: "what_does_option_take_do",
                                answers: [
                                    Answer(id: UUID(), title: "deletes_value", isCorrect: false),
                                    Answer(id: UUID(), title: "moves_out_of_some_leaving_none", isCorrect: true),
                                    Answer(id: UUID(), title: "clones_value", isCorrect: false),
                                    Answer(id: UUID(), title: "only_checks_presence", isCorrect: false)
                                ],
                                descriptionText: "take_extracts_inner_value_by_move_and_leaves_none",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 22
                            Question(
                                id: UUID(),
                                title: "why_request_review_takes_self_box_self",
                                answers: [
                                    Answer(id: UUID(), title: "for_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "consume_old_state_and_return_new_boxed_state", isCorrect: true),
                                    Answer(id: UUID(), title: "for_heap_work", isCorrect: false),
                                    Answer(id: UUID(), title: "syntax_error", isCorrect: false)
                                ],
                                descriptionText: "taking_box_self_transfers_ownership_and_enables_state_transition",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 23
                            Question(
                                id: UUID(),
                                title: "why_draftpost_has_no_content_method_in_alt_impl",
                                answers: [
                                    Answer(id: UUID(), title: "it_is_an_error", isCorrect: false),
                                    Answer(id: UUID(), title: "to_prevent_showing_draft_compile_time_error", isCorrect: true),
                                    Answer(id: UUID(), title: "for_performance", isCorrect: false),
                                    Answer(id: UUID(), title: "because_drafts_are_empty", isCorrect: false)
                                ],
                                descriptionText: "missing_method_makes_invalid_state_unrepresentable_at_compile_time",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 24
                            Question(
                                id: UUID(),
                                title: "type_oriented_request_review_approve_self_handling",
                                answers: [
                                    Answer(id: UUID(), title: "take_shared_ref_self", isCorrect: false),
                                    Answer(id: UUID(), title: "consume_self_and_return_new_type", isCorrect: true),
                                    Answer(id: UUID(), title: "take_mut_ref_self", isCorrect: false),
                                    Answer(id: UUID(), title: "clone_self", isCorrect: false)
                                ],
                                descriptionText: "methods_take_ownership_and_transform_to_next_state_type",
                                descriptionLink: "oop_rust_link"
                            ),
                            // 25
                            Question(
                                id: UUID(),
                                title: "advantage_of_encoding_states_in_types",
                                answers: [
                                    Answer(id: UUID(), title: "shorter_code", isCorrect: false),
                                    Answer(id: UUID(), title: "invalid_states_become_compile_errors", isCorrect: true),
                                    Answer(id: UUID(), title: "always_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "easier_to_read", isCorrect: false)
                                ],
                                descriptionText: "type_system_prevents_invalid_transitions_at_compile_time",
                                descriptionLink: "oop_rust_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "patterns_and_matching",
                        priority: 15,
                        questions: [
                            // 1
                            Question(
                                id: UUID(),
                                title: "where_can_patterns_be_used",
                                answers: [
                                    Answer(id: UUID(), title: "only_in_match", isCorrect: false),
                                    Answer(id: UUID(), title: "in_match_if_let_while_let_for_let_fn_params", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_let", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_loops", isCorrect: false)
                                ],
                                descriptionText: "patterns_work_in_match_if_let_while_let_for_let_and_function_parameters",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 2
                            Question(
                                id: UUID(),
                                title: "must_match_be_exhaustive",
                                answers: [
                                    Answer(id: UUID(), title: "no_optional", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_cover_all_values", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_option_result", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_type", isCorrect: false)
                                ],
                                descriptionText: "match_must_cover_all_possible_values",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 3
                            Question(
                                id: UUID(),
                                title: "underscore_pattern_in_match",
                                answers: [
                                    Answer(id: UUID(), title: "creates_variable_named_underscore", isCorrect: false),
                                    Answer(id: UUID(), title: "matches_any_without_binding", isCorrect: true),
                                    Answer(id: UUID(), title: "causes_compilation_error", isCorrect: false),
                                    Answer(id: UUID(), title: "skips_checking", isCorrect: false)
                                ],
                                descriptionText: "underscore_is_wildcard_match_no_binding",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 4
                            Question(
                                id: UUID(),
                                title: "mix_if_let_else_if_else_if_let",
                                answers: [
                                    Answer(id: UUID(), title: "no_syntax_error", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_more_flexible_than_match", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_let_and_else", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_option", isCorrect: false)
                                ],
                                descriptionText: "if_let_chains_are_allowed_and_flexible",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 5
                            Question(
                                id: UUID(),
                                title: "if_let_exhaustiveness_checked",
                                answers: [
                                    Answer(id: UUID(), title: "yes_always", isCorrect: false),
                                    Answer(id: UUID(), title: "no", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_some", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_else", isCorrect: false)
                                ],
                                descriptionText: "compiler_does_not_require_exhaustiveness_for_if_let",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 6
                            Question(
                                id: UUID(),
                                title: "what_does_while_let_do",
                                answers: [
                                    Answer(id: UUID(), title: "creates_infinite_loop", isCorrect: false),
                                    Answer(id: UUID(), title: "loops_while_pattern_matches", isCorrect: true),
                                    Answer(id: UUID(), title: "executes_once", isCorrect: false),
                                    Answer(id: UUID(), title: "equivalent_to_for", isCorrect: false)
                                ],
                                descriptionText: "while_let_runs_while_value_keeps_matching_pattern",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 7
                            Question(
                                id: UUID(),
                                title: "is_binding_in_for_a_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "no_just_variable", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_pattern", isCorrect: true),
                                    Answer(id: UUID(), title: "only_if_tuple", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_iterator", isCorrect: false)
                                ],
                                descriptionText: "for_binding_is_a_pattern_and_can_destructure",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 8
                            Question(
                                id: UUID(),
                                title: "what_is_irrefutable_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "might_not_match", isCorrect: false),
                                    Answer(id: UUID(), title: "always_matches", isCorrect: true),
                                    Answer(id: UUID(), title: "complex_pattern", isCorrect: false),
                                    Answer(id: UUID(), title: "pattern_with_condition", isCorrect: false)
                                ],
                                descriptionText: "irrefutable_matches_all_possible_values",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 9
                            Question(
                                id: UUID(),
                                title: "what_is_refutable_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "always_matches", isCorrect: false),
                                    Answer(id: UUID(), title: "may_fail_to_match_for_some_values", isCorrect: true),
                                    Answer(id: UUID(), title: "pattern_with_variables", isCorrect: false),
                                    Answer(id: UUID(), title: "pattern_in_match_only", isCorrect: false)
                                ],
                                descriptionText: "refutable_might_not_match_every_value",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 10
                            Question(
                                id: UUID(),
                                title: "where_only_irrefutable_allowed",
                                answers: [
                                    Answer(id: UUID(), title: "in_match", isCorrect: false),
                                    Answer(id: UUID(), title: "in_let_for_fn_params", isCorrect: true),
                                    Answer(id: UUID(), title: "in_if_let", isCorrect: false),
                                    Answer(id: UUID(), title: "everywhere", isCorrect: false)
                                ],
                                descriptionText: "let_for_and_fn_params_require_irrefutable_patterns",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 11
                            Question(
                                id: UUID(),
                                title: "some_x_in_let_some_x_value_refutable",
                                answers: [
                                    Answer(id: UUID(), title: "irrefutable", isCorrect: false),
                                    Answer(id: UUID(), title: "refutable", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_value", isCorrect: false),
                                    Answer(id: UUID(), title: "not_a_pattern", isCorrect: false)
                                ],
                                descriptionText: "some_x_can_fail_if_value_is_none",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 12
                            Question(
                                id: UUID(),
                                title: "fix_refutable_pattern_in_let",
                                answers: [
                                    Answer(id: UUID(), title: "use_match", isCorrect: false),
                                    Answer(id: UUID(), title: "use_if_let_or_let_else", isCorrect: true),
                                    Answer(id: UUID(), title: "remove_pattern", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_fix", isCorrect: false)
                                ],
                                descriptionText: "refutable_patterns_belong_in_if_let_or_let_else",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 13
                            Question(
                                id: UUID(),
                                title: "pipe_operator_in_patterns",
                                answers: [
                                    Answer(id: UUID(), title: "logical_or_matches_any", isCorrect: true),
                                    Answer(id: UUID(), title: "logical_and", isCorrect: false),
                                    Answer(id: UUID(), title: "bitwise_or", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_tuple", isCorrect: false)
                                ],
                                descriptionText: "vertical_bar_matches_any_of_listed_patterns",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 14
                            Question(
                                id: UUID(),
                                title: "inclusive_range_syntax_in_patterns",
                                answers: [
                                    Answer(id: UUID(), title: "exclusive_range", isCorrect: false),
                                    Answer(id: UUID(), title: "inclusive_range_dot_dot_equal", isCorrect: true),
                                    Answer(id: UUID(), title: "infinite_range", isCorrect: false),
                                    Answer(id: UUID(), title: "rest_of_values", isCorrect: false)
                                ],
                                descriptionText: "dot_dot_equal_creates_inclusive_range",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 15
                            Question(
                                id: UUID(),
                                title: "types_supported_for_range_patterns",
                                answers: [
                                    Answer(id: UUID(), title: "any_types", isCorrect: false),
                                    Answer(id: UUID(), title: "numbers_only", isCorrect: false),
                                    Answer(id: UUID(), title: "chars_and_numbers_only", isCorrect: true),
                                    Answer(id: UUID(), title: "i32_only", isCorrect: false)
                                ],
                                descriptionText: "range_patterns_work_for_numeric_and_char_types",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 16
                            Question(
                                id: UUID(),
                                title: "struct_destructuring_in_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "deletes_struct", isCorrect: false),
                                    Answer(id: UUID(), title: "breaks_struct_into_bindings", isCorrect: true),
                                    Answer(id: UUID(), title: "clones_struct", isCorrect: false),
                                    Answer(id: UUID(), title: "type_check_only", isCorrect: false)
                                ],
                                descriptionText: "destructure_extracts_fields_into_variables",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 17
                            Question(
                                id: UUID(),
                                title: "struct_destructuring_shorthand",
                                answers: [
                                    Answer(id: UUID(), title: "point_x_x_y_y", isCorrect: false),
                                    Answer(id: UUID(), title: "point_x_y", isCorrect: true),
                                    Answer(id: UUID(), title: "point_tuple_style", isCorrect: false),
                                    Answer(id: UUID(), title: "point_index_style", isCorrect: false)
                                ],
                                descriptionText: "field_init_shorthand_when_names_match",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 18
                            Question(
                                id: UUID(),
                                title: "difference_between__x_and__",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "_x_binds_value__does_not", isCorrect: true),
                                    Answer(id: UUID(), title: "underscore_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "_x_is_error", isCorrect: false)
                                ],
                                descriptionText: "_x_creates_binding_possibly_taking_ownership__ignores_value",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 19
                            Question(
                                id: UUID(),
                                title: "double_dot_in_patterns",
                                answers: [
                                    Answer(id: UUID(), title: "creates_range", isCorrect: false),
                                    Answer(id: UUID(), title: "ignores_remaining_parts", isCorrect: true),
                                    Answer(id: UUID(), title: "creates_array", isCorrect: false),
                                    Answer(id: UUID(), title: "syntax_error", isCorrect: false)
                                ],
                                descriptionText: "double_dot_skips_unspecified_fields_or_elements",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 20
                            Question(
                                id: UUID(),
                                title: "what_is_match_guard",
                                answers: [
                                    Answer(id: UUID(), title: "error_protection", isCorrect: false),
                                    Answer(id: UUID(), title: "extra_if_condition_after_pattern", isCorrect: true),
                                    Answer(id: UUID(), title: "type_checking", isCorrect: false),
                                    Answer(id: UUID(), title: "error_handler", isCorrect: false)
                                ],
                                descriptionText: "match_guard_adds_boolean_condition_to_arm",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 21
                            Question(
                                id: UUID(),
                                title: "exhaustiveness_with_match_guards",
                                answers: [
                                    Answer(id: UUID(), title: "checked_always", isCorrect: false),
                                    Answer(id: UUID(), title: "not_checked", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_simple_conditions", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_option", isCorrect: false)
                                ],
                                descriptionText: "guards_disable_strict_exhaustiveness_checking",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 22
                            Question(
                                id: UUID(),
                                title: "at_operator_in_patterns",
                                answers: [
                                    Answer(id: UUID(), title: "creates_reference", isCorrect: false),
                                    Answer(id: UUID(), title: "binds_value_while_testing_pattern", isCorrect: true),
                                    Answer(id: UUID(), title: "checks_type", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_copy", isCorrect: false)
                                ],
                                descriptionText: "at_binds_value_and_applies_subpattern_simultaneously",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 23
                            Question(
                                id: UUID(),
                                title: "guard_with_or_patterns_order",
                                answers: [
                                    Answer(id: UUID(), title: "applies_only_to_last", isCorrect: false),
                                    Answer(id: UUID(), title: "applies_to_whole_group", isCorrect: true),
                                    Answer(id: UUID(), title: "applies_only_to_first", isCorrect: false),
                                    Answer(id: UUID(), title: "does_not_work_with_or", isCorrect: false)
                                ],
                                descriptionText: "guard_attaches_to_entire_parenthesized_or_pattern",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 24
                            Question(
                                id: UUID(),
                                title: "can_double_dot_appear_twice_in_tuple_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "yes_no_restrictions", isCorrect: false),
                                    Answer(id: UUID(), title: "no_ambiguous", isCorrect: true),
                                    Answer(id: UUID(), title: "only_start_and_end", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_explicit_types", isCorrect: false)
                                ],
                                descriptionText: "two_ellipsis_would_be_ambiguous_on_how_many_to_ignore",
                                descriptionLink: "patterns_matching_link"
                            ),
                            // 25
                            Question(
                                id: UUID(),
                                title: "nested_enum_struct_destructuring",
                                answers: [
                                    Answer(id: UUID(), title: "no_only_one_level", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_patterns_can_be_nested", isCorrect: true),
                                    Answer(id: UUID(), title: "only_with_box", isCorrect: false),
                                    Answer(id: UUID(), title: "only_enums", isCorrect: false)
                                ],
                                descriptionText: "patterns_support_arbitrary_nesting_for_complex_structures",
                                descriptionLink: "patterns_matching_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "advanced_features",
                        priority: 16,
                        questions: [
                            // 1
                            Question(
                                id: UUID(),
                                title: "what_is_unsafe_rust",
                                answers: [
                                    Answer(id: UUID(), title: "dangerous_code_cannot_use", isCorrect: false),
                                    Answer(id: UUID(), title: "second_language_without_memory_safety_guarantees", isCorrect: true),
                                    Answer(id: UUID(), title: "deprecated_feature", isCorrect: false),
                                    Answer(id: UUID(), title: "code_with_errors", isCorrect: false)
                                ],
                                descriptionText: "unsafe_rust_relaxes_memory_safety_checks_for_more_control",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 2
                            Question(
                                id: UUID(),
                                title: "how_many_unsafe_superpowers",
                                answers: [
                                    Answer(id: UUID(), title: "three", isCorrect: false),
                                    Answer(id: UUID(), title: "four", isCorrect: false),
                                    Answer(id: UUID(), title: "five", isCorrect: true),
                                    Answer(id: UUID(), title: "unlimited", isCorrect: false)
                                ],
                                descriptionText: "five_abilities_raw_ptr_deref_call_unsafe_access_mut_static_impl_unsafe_trait_access_union_fields",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 3
                            Question(
                                id: UUID(),
                                title: "does_unsafe_disable_borrow_checker",
                                answers: [
                                    Answer(id: UUID(), title: "yes_completely", isCorrect: false),
                                    Answer(id: UUID(), title: "no_it_keeps_working", isCorrect: true),
                                    Answer(id: UUID(), title: "partially", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_context", isCorrect: false)
                                ],
                                descriptionText: "unsafe_does_not_turn_off_rust_safety_checks",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 4
                            Question(
                                id: UUID(),
                                title: "how_are_raw_pointers_created",
                                answers: [
                                    Answer(id: UUID(), title: "only_in_unsafe_blocks", isCorrect: false),
                                    Answer(id: UUID(), title: "with_amp_raw_const_and_amp_raw_mut", isCorrect: true),
                                    Answer(id: UUID(), title: "through_new_keyword", isCorrect: false),
                                    Answer(id: UUID(), title: "automatically_by_compiler", isCorrect: false)
                                ],
                                descriptionText: "use_raw_pointer_operators_for_const_and_mut",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 5
                            Question(
                                id: UUID(),
                                title: "can_raw_pointers_be_created_in_safe_code",
                                answers: [
                                    Answer(id: UUID(), title: "no_only_in_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_but_dereferencing_requires_unsafe", isCorrect: true),
                                    Answer(id: UUID(), title: "only_on_stack", isCorrect: false),
                                    Answer(id: UUID(), title: "only_with_compiler_permission", isCorrect: false)
                                ],
                                descriptionText: "creation_is_safe_dereference_requires_unsafe",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 6
                            Question(
                                id: UUID(),
                                title: "what_rules_do_raw_pointers_ignore",
                                answers: [
                                    Answer(id: UUID(), title: "none", isCorrect: false),
                                    Answer(id: UUID(), title: "allow_simultaneous_immut_and_mut_to_same_location", isCorrect: true),
                                    Answer(id: UUID(), title: "only_lifetime_rules", isCorrect: false),
                                    Answer(id: UUID(), title: "all_rules_automatically", isCorrect: false)
                                ],
                                descriptionText: "raw_pointers_can_violate_aliasing_and_borrow_rules",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 7
                            Question(
                                id: UUID(),
                                title: "how_to_call_unsafe_function",
                                answers: [
                                    Answer(id: UUID(), title: "directly_anywhere", isCorrect: false),
                                    Answer(id: UUID(), title: "inside_unsafe_block_only", isCorrect: true),
                                    Answer(id: UUID(), title: "with_compiler_flag", isCorrect: false),
                                    Answer(id: UUID(), title: "through_wrapper", isCorrect: false)
                                ],
                                descriptionText: "unsafe_fn_calls_require_unsafe_block",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 8
                            Question(
                                id: UUID(),
                                title: "unsafe_block_inside_unsafe_fn_needed",
                                answers: [
                                    Answer(id: UUID(), title: "no_function_already_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_still_required_for_unsafe_ops", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_operation", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_raw_ptrs", isCorrect: false)
                                ],
                                descriptionText: "unsafe_ops_are_marked_even_inside_unsafe_fn",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 9
                            Question(
                                id: UUID(),
                                title: "what_is_safe_abstraction",
                                answers: [
                                    Answer(id: UUID(), title: "abstract_type", isCorrect: false),
                                    Answer(id: UUID(), title: "safe_wrapper_over_unsafe_code", isCorrect: true),
                                    Answer(id: UUID(), title: "type_without_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "abstract_function", isCorrect: false)
                                ],
                                descriptionText: "expose_safe_api_hiding_internal_unsafe",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 10
                            Question(
                                id: UUID(),
                                title: "what_does_extern_c_do",
                                answers: [
                                    Answer(id: UUID(), title: "imports_c_code", isCorrect: false),
                                    Answer(id: UUID(), title: "defines_abi_for_external_calls", isCorrect: true),
                                    Answer(id: UUID(), title: "compiles_to_c", isCorrect: false),
                                    Answer(id: UUID(), title: "creates_c_library", isCorrect: false)
                                ],
                                descriptionText: "extern_c_sets_application_binary_interface",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 11
                            Question(
                                id: UUID(),
                                title: "must_extern_block_be_unsafe",
                                answers: [
                                    Answer(id: UUID(), title: "no_never", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_always", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_some_functions", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_language", isCorrect: false)
                                ],
                                descriptionText: "rust_cannot_verify_external_functions",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 12
                            Question(
                                id: UUID(),
                                title: "safe_fns_inside_unsafe_extern_block",
                                answers: [
                                    Answer(id: UUID(), title: "no_all_must_be_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_mark_with_safe", isCorrect: true),
                                    Answer(id: UUID(), title: "only_for_c_functions", isCorrect: false),
                                    Answer(id: UUID(), title: "automatic_for_some", isCorrect: false)
                                ],
                                descriptionText: "individual_items_can_be_declared_safe",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 13
                            Question(
                                id: UUID(),
                                title: "static_vars_vs_constants",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "statics_have_fixed_memory_address", isCorrect: true),
                                    Answer(id: UUID(), title: "statics_are_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "consts_are_mutable", isCorrect: false)
                                ],
                                descriptionText: "statics_reside_at_fixed_address_consts_are_inlined",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 14
                            Question(
                                id: UUID(),
                                title: "is_accessing_immutable_static_safe",
                                answers: [
                                    Answer(id: UUID(), title: "no_always_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_safe", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_type", isCorrect: false),
                                    Answer(id: UUID(), title: "only_for_reading", isCorrect: false)
                                ],
                                descriptionText: "immutable_static_access_is_safe",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 15
                            Question(
                                id: UUID(),
                                title: "why_mutable_static_is_unsafe",
                                answers: [
                                    Answer(id: UUID(), title: "it_is_slow", isCorrect: false),
                                    Answer(id: UUID(), title: "can_cause_data_race_across_threads", isCorrect: true),
                                    Answer(id: UUID(), title: "uses_too_much_memory", isCorrect: false),
                                    Answer(id: UUID(), title: "deprecated", isCorrect: false)
                                ],
                                descriptionText: "shared_mutable_global_requires_synchronization",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 16
                            Question(
                                id: UUID(),
                                title: "what_is_an_unsafe_trait",
                                answers: [
                                    Answer(id: UUID(), title: "trait_with_errors", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_with_invariants_compiler_cannot_verify", isCorrect: true),
                                    Answer(id: UUID(), title: "deprecated_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "systems_programming_trait", isCorrect: false)
                                ],
                                descriptionText: "unsafe_trait_has_contract_requiring_manual_uphold",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 17
                            Question(
                                id: UUID(),
                                title: "how_to_declare_unsafe_trait",
                                answers: [
                                    Answer(id: UUID(), title: "trait_foo_with_unsafe_fns", isCorrect: false),
                                    Answer(id: UUID(), title: "unsafe_trait_foo", isCorrect: true),
                                    Answer(id: UUID(), title: "attr_unsafe_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_declare", isCorrect: false)
                                ],
                                descriptionText: "put_unsafe_before_trait_keyword",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 18
                            Question(
                                id: UUID(),
                                title: "how_to_impl_unsafe_trait",
                                answers: [
                                    Answer(id: UUID(), title: "regular_impl", isCorrect: false),
                                    Answer(id: UUID(), title: "unsafe_impl", isCorrect: true),
                                    Answer(id: UUID(), title: "impl_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "compiler_flag", isCorrect: false)
                                ],
                                descriptionText: "implementations_must_be_marked_unsafe_impl",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 19
                            Question(
                                id: UUID(),
                                title: "what_is_miri",
                                answers: [
                                    Answer(id: UUID(), title: "rust_compiler", isCorrect: false),
                                    Answer(id: UUID(), title: "tool_detecting_undefined_behavior", isCorrect: true),
                                    Answer(id: UUID(), title: "unsafe_library", isCorrect: false),
                                    Answer(id: UUID(), title: "async_runtime", isCorrect: false)
                                ],
                                descriptionText: "miri_interprets_rust_to_find_ub_at_runtime",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 20
                            Question(
                                id: UUID(),
                                title: "what_is_associated_type_in_trait",
                                answers: [
                                    Answer(id: UUID(), title: "struct_field_type", isCorrect: false),
                                    Answer(id: UUID(), title: "placeholder_type_chosen_by_impl", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_parameter", isCorrect: false),
                                    Answer(id: UUID(), title: "method_return_type", isCorrect: false)
                                ],
                                descriptionText: "impl_sets_concrete_type_for_associated_placeholder",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 21
                            Question(
                                id: UUID(),
                                title: "associated_type_vs_generic_on_trait",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "associated_type_fixed_per_impl_generics_allow_multiple_impls", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_is_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "associated_only_for_iterator", isCorrect: false)
                                ],
                                descriptionText: "associated_type_limits_to_one_impl_per_type",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 22
                            Question(
                                id: UUID(),
                                title: "what_is_default_type_parameter",
                                answers: [
                                    Answer(id: UUID(), title: "required_param", isCorrect: false),
                                    Answer(id: UUID(), title: "default_type_for_generic_param", isCorrect: true),
                                    Answer(id: UUID(), title: "first_fn_param", isCorrect: false),
                                    Answer(id: UUID(), title: "std_type", isCorrect: false)
                                ],
                                descriptionText: "syntax_placeholder_equals_concrete_type",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 23
                            Question(
                                id: UUID(),
                                title: "what_is_fully_qualified_syntax",
                                answers: [
                                    Answer(id: UUID(), title: "full_module_name", isCorrect: false),
                                    Answer(id: UUID(), title: "explicit_trait_call_syntax_type_as_trait_fn", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_syntax", isCorrect: false),
                                    Answer(id: UUID(), title: "full_file_path", isCorrect: false)
                                ],
                                descriptionText: "use_type_as_trait_double_colon_function_for_disambiguation",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 24
                            Question(
                                id: UUID(),
                                title: "what_is_supertrait",
                                answers: [
                                    Answer(id: UUID(), title: "most_important_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_required_by_another_trait", isCorrect: true),
                                    Answer(id: UUID(), title: "base_trait_in_hierarchy", isCorrect: false),
                                    Answer(id: UUID(), title: "std_only_trait", isCorrect: false)
                                ],
                                descriptionText: "dependent_trait_requires_supertrait_implemented",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 25
                            Question(
                                id: UUID(),
                                title: "how_to_specify_supertrait",
                                answers: [
                                    Answer(id: UUID(), title: "trait_a_colon_b", isCorrect: true),
                                    Answer(id: UUID(), title: "trait_a_extends_b", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_a_arrow_b", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_a_inherits_b", isCorrect: false)
                                ],
                                descriptionText: "use_trait_a_colon_supertrait_syntax",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 26
                            Question(
                                id: UUID(),
                                title: "what_is_newtype_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "new_primitive_type", isCorrect: false),
                                    Answer(id: UUID(), title: "wrap_existing_type_in_tuple_struct", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_type", isCorrect: false),
                                    Answer(id: UUID(), title: "enum_variant", isCorrect: false)
                                ],
                                descriptionText: "tuple_struct_with_one_field_creates_distinct_type",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 27
                            Question(
                                id: UUID(),
                                title: "why_use_newtype_pattern",
                                answers: [
                                    Answer(id: UUID(), title: "for_speed", isCorrect: false),
                                    Answer(id: UUID(), title: "bypass_orphan_rule_and_gain_type_safety", isCorrect: true),
                                    Answer(id: UUID(), title: "for_code_beauty", isCorrect: false),
                                    Answer(id: UUID(), title: "mandatory_requirement", isCorrect: false)
                                ],
                                descriptionText: "newtype_enables_external_trait_impls_and_stronger_types",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 28
                            Question(
                                id: UUID(),
                                title: "what_is_type_alias",
                                answers: [
                                    Answer(id: UUID(), title: "type_copy", isCorrect: false),
                                    Answer(id: UUID(), title: "synonym_for_existing_type", isCorrect: true),
                                    Answer(id: UUID(), title: "new_type", isCorrect: false),
                                    Answer(id: UUID(), title: "generic_type", isCorrect: false)
                                ],
                                descriptionText: "type_alias_does_not_create_distinct_type",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 29
                            Question(
                                id: UUID(),
                                title: "does_type_alias_provide_newtype_safety",
                                answers: [
                                    Answer(id: UUID(), title: "yes_completely", isCorrect: false),
                                    Answer(id: UUID(), title: "no_its_just_a_synonym", isCorrect: true),
                                    Answer(id: UUID(), title: "partially", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_type", isCorrect: false)
                                ],
                                descriptionText: "aliases_share_identity_with_underlying_type",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 30
                            Question(
                                id: UUID(),
                                title: "what_is_never_type",
                                answers: [
                                    Answer(id: UUID(), title: "error_type", isCorrect: false),
                                    Answer(id: UUID(), title: "type_for_functions_that_never_return", isCorrect: true),
                                    Answer(id: UUID(), title: "empty_enum", isCorrect: false),
                                    Answer(id: UUID(), title: "type_for_panic", isCorrect: false)
                                ],
                                descriptionText: "never_type_bang_indicates_diverging_functions",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 31
                            Question(
                                id: UUID(),
                                title: "which_functions_return_never_type",
                                answers: [
                                    Answer(id: UUID(), title: "functions_with_errors", isCorrect: false),
                                    Answer(id: UUID(), title: "diverging_functions_infinite_loop_or_panic", isCorrect: true),
                                    Answer(id: UUID(), title: "async_functions", isCorrect: false),
                                    Answer(id: UUID(), title: "generic_functions", isCorrect: false)
                                ],
                                descriptionText: "diverge_never_return_control_to_caller",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 32
                            Question(
                                id: UUID(),
                                title: "what_is_dst",
                                answers: [
                                    Answer(id: UUID(), title: "fixed_size_type", isCorrect: false),
                                    Answer(id: UUID(), title: "dynamically_sized_type_known_only_at_runtime", isCorrect: true),
                                    Answer(id: UUID(), title: "generic_type", isCorrect: false),
                                    Answer(id: UUID(), title: "dynamic_memory_type", isCorrect: false)
                                ],
                                descriptionText: "dst_size_not_known_at_compile_time",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 33
                            Question(
                                id: UUID(),
                                title: "is_str_a_dst",
                                answers: [
                                    Answer(id: UUID(), title: "no_regular_type", isCorrect: false),
                                    Answer(id: UUID(), title: "yes", isCorrect: true),
                                    Answer(id: UUID(), title: "depends_on_context", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_unsafe", isCorrect: false)
                                ],
                                descriptionText: "bare_str_is_dst_length_known_at_runtime",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 34
                            Question(
                                id: UUID(),
                                title: "how_to_work_with_dst",
                                answers: [
                                    Answer(id: UUID(), title: "directly", isCorrect: false),
                                    Answer(id: UUID(), title: "through_pointer_reference_or_box", isCorrect: true),
                                    Answer(id: UUID(), title: "only_in_unsafe", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_work", isCorrect: false)
                                ],
                                descriptionText: "use_refs_or_box_like_amp_str_box_str_amp_dyn_trait",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 35
                            Question(
                                id: UUID(),
                                title: "what_is_sized_trait",
                                answers: [
                                    Answer(id: UUID(), title: "trait_for_large_types", isCorrect: false),
                                    Answer(id: UUID(), title: "auto_trait_for_types_with_known_size_at_compile_time", isCorrect: true),
                                    Answer(id: UUID(), title: "trait_for_dst", isCorrect: false),
                                    Answer(id: UUID(), title: "optimization_trait", isCorrect: false)
                                ],
                                descriptionText: "sized_is_implicit_bound_for_type_parameters",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 36
                            Question(
                                id: UUID(),
                                title: "what_does_qmark_sized_mean",
                                answers: [
                                    Answer(id: UUID(), title: "type_must_be_sized", isCorrect: false),
                                    Answer(id: UUID(), title: "type_may_or_may_not_be_sized", isCorrect: true),
                                    Answer(id: UUID(), title: "type_must_not_be_sized", isCorrect: false),
                                    Answer(id: UUID(), title: "syntax_error", isCorrect: false)
                                ],
                                descriptionText: "relaxes_default_sized_bound",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 37
                            Question(
                                id: UUID(),
                                title: "what_is_function_pointer_fn",
                                answers: [
                                    Answer(id: UUID(), title: "pointer_to_any_function", isCorrect: false),
                                    Answer(id: UUID(), title: "type_for_passing_functions_as_values", isCorrect: true),
                                    Answer(id: UUID(), title: "closure_type", isCorrect: false),
                                    Answer(id: UUID(), title: "trait_for_functions", isCorrect: false)
                                ],
                                descriptionText: "fn_pointer_can_be_passed_called_like_function",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 38
                            Question(
                                id: UUID(),
                                title: "fn_pointers_implement_closure_traits",
                                answers: [
                                    Answer(id: UUID(), title: "no", isCorrect: false),
                                    Answer(id: UUID(), title: "yes_fn_fnmut_fnonce", isCorrect: true),
                                    Answer(id: UUID(), title: "only_fn", isCorrect: false),
                                    Answer(id: UUID(), title: "depends_on_function", isCorrect: false)
                                ],
                                descriptionText: "function_pointers_implement_all_three_closure_traits",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 39
                            Question(
                                id: UUID(),
                                title: "how_to_return_closure",
                                answers: [
                                    Answer(id: UUID(), title: "fn_returns_trait", isCorrect: false),
                                    Answer(id: UUID(), title: "fn_arrow_impl_fn", isCorrect: true),
                                    Answer(id: UUID(), title: "fn_arrow_closure", isCorrect: false),
                                    Answer(id: UUID(), title: "cannot_return", isCorrect: false)
                                ],
                                descriptionText: "use_impl_trait_to_return_closure_type_opaquely",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 40
                            Question(
                                id: UUID(),
                                title: "when_need_box_dyn_fn_to_return_closure",
                                answers: [
                                    Answer(id: UUID(), title: "always", isCorrect: false),
                                    Answer(id: UUID(), title: "when_various_closure_types_in_one_place", isCorrect: true),
                                    Answer(id: UUID(), title: "never", isCorrect: false),
                                    Answer(id: UUID(), title: "only_in_unsafe", isCorrect: false)
                                ],
                                descriptionText: "trait_objects_allow_heterogeneous_closures",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 41
                            Question(
                                id: UUID(),
                                title: "what_is_metaprogramming",
                                answers: [
                                    Answer(id: UUID(), title: "ai_programming", isCorrect: false),
                                    Answer(id: UUID(), title: "code_that_writes_code", isCorrect: true),
                                    Answer(id: UUID(), title: "parallel_programming", isCorrect: false),
                                    Answer(id: UUID(), title: "low_level_programming", isCorrect: false)
                                ],
                                descriptionText: "generate_or_transform_code_programmatically",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 42
                            Question(
                                id: UUID(),
                                title: "macros_vs_functions",
                                answers: [
                                    Answer(id: UUID(), title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(), title: "macros_expand_pre_compile_and_accept_var_args", isCorrect: true),
                                    Answer(id: UUID(), title: "macros_are_faster", isCorrect: false),
                                    Answer(id: UUID(), title: "functions_deprecated", isCorrect: false)
                                ],
                                descriptionText: "macros_operate_on_tokens_before_type_checking",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 43
                            Question(
                                id: UUID(),
                                title: "what_is_declarative_macro",
                                answers: [
                                    Answer(id: UUID(), title: "macro_with_declaration", isCorrect: false),
                                    Answer(id: UUID(), title: "macro_rules_pattern_matching_macro", isCorrect: true),
                                    Answer(id: UUID(), title: "procedural_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "deprecated_macro_type", isCorrect: false)
                                ],
                                descriptionText: "macro_rules_uses_match_like_patterns_and_expansions",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 44
                            Question(
                                id: UUID(),
                                title: "how_many_types_of_procedural_macros",
                                answers: [
                                    Answer(id: UUID(), title: "one", isCorrect: false),
                                    Answer(id: UUID(), title: "two", isCorrect: false),
                                    Answer(id: UUID(), title: "three", isCorrect: true),
                                    Answer(id: UUID(), title: "four", isCorrect: false)
                                ],
                                descriptionText: "custom_derive_attribute_like_function_like",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 45
                            Question(
                                id: UUID(),
                                title: "what_is_custom_derive_macro",
                                answers: [
                                    Answer(id: UUID(), title: "macro_for_deriving", isCorrect: false),
                                    Answer(id: UUID(), title: "proc_macro_generating_code_with_derive_attr", isCorrect: true),
                                    Answer(id: UUID(), title: "macro_for_structs", isCorrect: false),
                                    Answer(id: UUID(), title: "macro_for_traits", isCorrect: false)
                                ],
                                descriptionText: "uses_attr_derive_yourmacro_to_generate_impls",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 46
                            Question(
                                id: UUID(),
                                title: "proc_macro_input_and_output",
                                answers: [
                                    Answer(id: UUID(), title: "string_to_string", isCorrect: false),
                                    Answer(id: UUID(), title: "tokenstream_to_tokenstream", isCorrect: true),
                                    Answer(id: UUID(), title: "ast_to_ast", isCorrect: false),
                                    Answer(id: UUID(), title: "code_to_code", isCorrect: false)
                                ],
                                descriptionText: "procedural_macros_transform_token_streams",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 47
                            Question(
                                id: UUID(),
                                title: "what_does_macro_export_do",
                                answers: [
                                    Answer(id: UUID(), title: "exports_macro_to_file", isCorrect: false),
                                    Answer(id: UUID(), title: "makes_macro_available_when_importing_crate", isCorrect: true),
                                    Answer(id: UUID(), title: "compiles_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "removes_macro", isCorrect: false)
                                ],
                                descriptionText: "attribute_exposes_macro_publicly_for_downstream_crates",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 48
                            Question(
                                id: UUID(),
                                title: "where_proc_macros_must_live",
                                answers: [
                                    Answer(id: UUID(), title: "anywhere", isCorrect: false),
                                    Answer(id: UUID(), title: "separate_crate_with_proc_macro_true", isCorrect: true),
                                    Answer(id: UUID(), title: "in_main_rs", isCorrect: false),
                                    Answer(id: UUID(), title: "in_lib_rs_only", isCorrect: false)
                                ],
                                descriptionText: "proc_macros_require_dedicated_proc_macro_crate",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 49
                            Question(
                                id: UUID(),
                                title: "what_does_syn_crate_do",
                                answers: [
                                    Answer(id: UUID(), title: "synchronizes_code", isCorrect: false),
                                    Answer(id: UUID(), title: "parses_rust_code_into_data_structures", isCorrect: true),
                                    Answer(id: UUID(), title: "compiles_macros", isCorrect: false),
                                    Answer(id: UUID(), title: "checks_syntax", isCorrect: false)
                                ],
                                descriptionText: "syn_parses_tokenstream_into_ast_like_structures",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 50
                            Question(
                                id: UUID(),
                                title: "what_does_quote_crate_do",
                                answers: [
                                    Answer(id: UUID(), title: "quotes_code", isCorrect: false),
                                    Answer(id: UUID(), title: "converts_syntax_structures_back_to_rust_code", isCorrect: true),
                                    Answer(id: UUID(), title: "parses_code", isCorrect: false),
                                    Answer(id: UUID(), title: "documents_macros", isCorrect: false)
                                ],
                                descriptionText: "quote_turns_ast_like_structures_into_tokens_with_macros",
                                descriptionLink: "advanced_features_link"
                            ),
                            // 51
                            Question(
                                id: UUID(),
                                title: "what_is_attribute_like_macro",
                                answers: [
                                    Answer(id: UUID(), title: "macro_for_attributes", isCorrect: false),
                                    Answer(id: UUID(), title: "macro_creating_custom_attributes_for_items", isCorrect: true),
                                    Answer(id: UUID(), title: "derive_macro", isCorrect: false),
                                    Answer(id: UUID(), title: "function_macro", isCorrect: false)
                                ],
                                descriptionText: "attribute_like_macros_define_new_attributes_for_items",
                                descriptionLink: "advanced_features_link"
                            )
                        ]
                    )
                ]
            )
        }
    )
}

extension DependencyValues {
    var seedService: SeedService {
        get { self[SeedService.self] }
        set { self[SeedService.self] = newValue }
    }
}
