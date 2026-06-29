describe('Assign Training', () => {

it('assign training successfully', () => {

cy.visit('/training');

cy.get('#assign').click();

cy.contains('Assigned');
});
});