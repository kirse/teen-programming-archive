// Eric Kirse (1337 C0d3rZ, Inc.)
// Ch6Proj1
// Period 4
// February 4, 2003
// Purpose - Implement a binary tree with extra functions.

#include <iostream.h>
#include "apstring.h"

struct node
{
	int data;
	// holds data for node
	node * left;
	// pointer to left child
	node * right;
	// pointer to right child
};

bool insert(node * &root, const int &data);
bool remove(node * &root, const int &data);
node *find(node * root, const int &target);
void destroy(node * root);
void traverseInorder(node *root);
void traversePreorder(node *root);
void traversePostorder(node *root);
int distance(node * T1, node * T2);
bool isEqual(node * T1, node * T2);
void printRelationship(const int num1, const int num2, node *T);

int main()
{
	node *root = 0;
	// root of binary tree #1
	node *root2 = 0;
	// root of binary tree #2

	// insert data into test trees
	cout << ">>>>> Inserting and populating both trees" << endl;
	insert(root2, 3);
	insert(root2, 2);
	insert(root2, 1);
	insert(root2, 4);
	insert(root2, 5);
	insert(root, 3);
	insert(root, 2);
	insert(root, 1);
	insert(root, 4);
	insert(root, 5);
	cout << "Insertion complete." << endl << endl;

	// traverse both trees in different formats
	cout << ">>>>> Traversing Trees" << endl;
	cout << "Inorder Traverse / Tree 1:   ";
	traverseInorder(root);
	cout << endl << "Inorder Traverse / Tree 2:   ";
	traverseInorder(root2);
	cout << endl << "Preorder Traverse / Tree 1:  ";
	traversePreorder(root);
	cout << endl << "Preorder Traverse / Tree 2:  ";
	traversePreorder(root2);
	cout << endl << "Postorder Traverse / Tree 1: ";
	traversePostorder(root);
	cout << endl << "Postorder Traverse / Tree 2: ";
	traversePostorder(root2);

	// remove a node from a tree and output for confirmation
	cout << endl << endl << ">>>>> Remove 5 from Tree 1..." << endl;
	remove(root,5);
	cout << "Remove operation complete: ";
	traverseInorder(root);

	// find a value within a tree
	cout << endl << endl << ">>>>> Finding 4 in Tree 1: ";
	cout << find(root,4) << " holds value " << find(root,4)->data;

	// test if two trees are equal to each other
	cout << endl << endl << ">>>>> IsEqual Comparison" << endl;

	if (isEqual(root,root2))
	{
		cout << "Tree 1 is Equal to Tree 2." << endl;
	}
	else
	{
		cout << "Tree 1 is not Equal to Tree 2." << endl;
	}

	// find distance between two nodes of a tree
	cout << endl << endl << ">>>>> Distance Test";
	cout << endl << "The distance between 1,4 in Tree 1 is ";
	cout << distance(root,root->right);

	// test relationship between two nodes in tree
	cout << endl << endl << ">>>>> Testing Node Relationship";
	cout << endl << "Using nodes 1 and 3 in Tree 1" << endl;
	printRelationship(1, 3, root);

	// destroy trees (comment traverse to eliminate error)
	cout << endl << endl << ">>>>> Destroying Trees" << endl;
	destroy(root);
	destroy(root2);
	traversePreorder(root);

	return 0;
}// end of main


void destroy(node * root)
{
	if (!root) 
	{
		return;
	}

	destroy(root->left);
	destroy(root->right);
	delete root;
}// end of destroy

node * find(node * root, const int &target)
{
	if (!root)
	{
		return 0;
	}

	if (target == root->data)
	{
		return root;
	}
	else if (target < root->data)
	{
		return find(root->left,target);
	}
	else
	{
		return find(root->right,target);
	}
}// end of find
 
bool insert(node * &root, const int &data)
{
	if (!root)
	{
		node * newNode = new node;
	// create new node in memory

		if (!newNode)
		{
	// the node didn't get created somehow
			return false;
		}
		
	// assign all important info, return insert successful
		newNode->data = data;
		newNode->left = 0;
		newNode->right = 0;
		root = newNode;
		return true;
	}

	// determine which way to traverse to keep our tree
	//		in order...
	if (data == root->data)
	{
		return true;
	}
	else if (data < root->data)
	{
		return insert(root->left, data);
	}
	else
	{
		return insert(root->right, data);
	}

}// end of insert

void visit(node *myNode)
{
	cout << myNode->data << ' ';
}// end of visit

void traversePreorder(node *root)
{
	if (!root)
	{ 
		return;
	}

	visit(root);
	traversePreorder(root->left);
	traversePreorder(root->right);
}// end of traversePreorder

void traversePostorder(node *root)
{
	if (!root)
	{
		return;
	}

	traversePostorder(root->left);
	traversePostorder(root->right);
	visit(root);
}// end of traversePostorder

void traverseInorder(node *root)
{
	if (!root) 
	{
		return;
	}

	traverseInorder(root->left);
	visit(root);
	traverseInorder(root->right);
}// end of traverseInorder

bool remove(node * &root, const int &data)
{
	if (!root)
	{
		return false;
	}

	if (data == root->data)
	{
	// just the root node to delete
		if (root->right == NULL && root->left == NULL)
		{
			node *x = root;
			root = 0;
			delete x;
			return 0;
		}
	// no left, but right exists
		if (root->right && root->left == NULL)
		{
			node *x = root;
			root = x->right;
			delete x;
			return true;
		}
	// no right, but left exists
		if (root->left && root->right == NULL)
		{
			node *x = root;
			root = x->left;
			root->right = x->right;
			delete x;
			return false;
		}
	// both a left and right node exists
		else
		{
			node *x = root;
			node *q = x->left->right;
			node *qrootParent = x->left;

	// rearrange until right is null
			while (q->right != 0)
			{
				q = q->right;
				qrootParent = qrootParent->right;
			}

			q->right = x->right;
			root = q;
			qrootParent->right = q->left;
			q->left = x->left;
			delete x;
			return true;
		}
	}
	else if (data < root->data)
	{
		return remove(root->left,data);
	}
	else
	{
		return remove(root->right,data);
	}
}// end of remove

int distance(node * T1, node * T2)
{
	if (!(T2))
	{
		return 0;
	}
	else if (!(T1))
	{
		return -1;
	}
	else if (T1->data == T2->data)
	{
		return 0;
	}
	else if (T2->data < T1->data)
	{
		return 1 + distance(T1->left,T2);
	}
	else
	{
		return 1 + distance(T1->right,T2);
	}
}// end of distance

bool isEqual(node * T1, node * T2)
{
	if (!(T1) && !(T2))
	{
		return true;
	}
	else if (!(T1) && T2)
	{
		return false;
	}
	else if (T1 && !(T2))
	{
		return false;
	}
	else
	{
		if (T1->data == T2->data)
		{
			isEqual(T1->left,T2->left);
			isEqual(T1->right,T2->right);
		}
		else
		{
			return false;
		}
	}
}// end of isEqual

void printRelationship(const int num1, const int num2, node *T)
{
	int howfar = 0;

	node * n1 = find(T, num1);
	node * n2 = find(T, num2);

	howfar = distance(n1, n2);

	if (howfar == -1 || howfar == 0)
	{
		cout << num1 << " is not an ancestor of " << num2 << endl;
	}
	else if (howfar >= 1)
	{
	// output as many "grands" as we are from the parent
		cout << num1 << " is a ";
		
		while (howfar > 1)
		{
			howfar--;
			cout << "grand ";
		}
		cout << "parent of " << num2 << endl;
	}
}// end of printRelationship

