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
