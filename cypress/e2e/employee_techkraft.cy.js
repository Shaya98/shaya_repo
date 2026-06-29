describe('Create Employee', () => {

it('should create employee', () => {

cy.visit('/employees');

cy.get('#name').type('John Smith');

cy.get('#email').type('john@test.com');

cy.get('#save').click();

cy.contains('Employee created');
});
});

describe('Duplicate Email', () => {

it('should block duplicate email', () => {

cy.createEmployee();

cy.createEmployee();

cy.contains('Email already exists');
});
});