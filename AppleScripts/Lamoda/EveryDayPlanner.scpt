FasdUAS 1.101.10   ��   ��    k             l      ��  ��    ~ x

Appends an entry to today�s Daily Record of Events in Evernote.

For best results, invoke the script from LaunchBar.

     � 	 	 � 
 
 A p p e n d s   a n   e n t r y   t o   t o d a y  s   D a i l y   R e c o r d   o f   E v e n t s   i n   E v e r n o t e . 
 
 F o r   b e s t   r e s u l t s ,   i n v o k e   t h e   s c r i p t   f r o m   L a u n c h B a r . 
 
   
  
 l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    l         k            r         m        �    N e w   l a m o d a   t a s k  o      ���� 0 thetitle theTitle      I   ��  
�� .sysodlogaskr        TEXT  m       �   4 W h a t   i s   t a s k   l i n k   i n   j i r a ?  ��   !
�� 
dtxt   m     " " � # #   ! �� $��
�� 
appr $ o    	���� 0 thetitle theTitle��     %�� % I    �� &���� 0 handle_string   &  '�� ' l    (���� ( n    ) * ) 1    ��
�� 
ttxt * 1    ��
�� 
rslt��  ��  ��  ��  ��    - ' Called when the script is run normally     � + + N   C a l l e d   w h e n   t h e   s c r i p t   i s   r u n   n o r m a l l y   , - , l     ��������  ��  ��   -  . / . i     0 1 0 I      �� 2���� 0 handle_string   2  3�� 3 o      ���� 0 str  ��  ��   1 l    � 4 5 6 4 k     � 7 7  8 9 8 O     � : ; : k    � < <  = > = l   ��������  ��  ��   >  ? @ ? r    	 A B A n    C D C 1    ��
�� 
txdl D 1    ��
�� 
ascr B o      ���� 0 astid ASTID @  E F E r   
  G H G m   
  I I � J J  , H n      K L K 1    ��
�� 
txdl L 1    ��
�� 
ascr F  M N M r     O P O n     Q R Q 4   �� S
�� 
citm S m    ����  R o    ���� 0 str   P o      ���� 0 tasklink taskLink N  T U T r     V W V n     X Y X 4   �� Z
�� 
citm Z m    ����  Y o    ���� 0 str   W o      ���� 0 taskname taskName U  [ \ [ r    + ] ^ ] b    ) _ ` _ b    ' a b a b    % c d c m     e e � f f  [ d l   $ g���� g I   $�� h��
�� .sysoexecTEXT���     TEXT h m      i i � j j   d a t e   ' + % Y - % m - % d '��  ��  ��   b m   % & k k � l l 
   L T ]   ` o   ' (���� 0 taskname taskName ^ o      ���� 0 	nodetitle 	nodeTitle \  m n m r   , 3 o p o b   , 1 q r q b   , / s t s o   , -���� 0 tasklink taskLink t m   - . u u � v v    r o   / 0���� 0 taskname taskName p o      ���� 0 notename noteName n  w x w r   4 ; y z y b   4 9 { | { b   4 7 } ~ } m   4 5   � � �  < a   h r e f = " ~ o   5 6���� 0 tasklink taskLink | m   7 8 � � � � � , " >AAK;:0  =0  7040GC < / a > z o      ���� 0 notehtml noteHTML x  � � � r   < A � � � o   < =���� 0 astid ASTID � n      � � � 1   > @��
�� 
txdl � 1   = >��
�� 
ascr �  � � � l  B B��������  ��  ��   �  � � � r   B Q � � � I  B O���� �
�� .EVRNcrntnull��� ��� null��   � �� � �
�� 
Enhl � o   D E���� 0 notehtml noteHTML � �� � �
�� 
Entt � o   F G���� 0 	nodetitle 	nodeTitle � �� ���
�� 
Ennb � m   H I � � � � �  L a m o d a��   � o      ���� 0 mynote myNote �  � � � I  R b�� � �
�� .EVRNassnnull���     **** � 4   R Z�� �
�� 
EVtg � m   V Y � � � � �  l a m o d a - t a s k � �� ���
�� 
EV13 � o   ] ^���� 0 mynote myNote��   �  � � � I  c s�� � �
�� .EVRNassnnull���     **** � 4   c k�� �
�� 
EVtg � m   g j � � � � �  l a m o d a � �� ���
�� 
EV13 � o   n o���� 0 mynote myNote��   �  � � � l  t t��������  ��  ��   �  � � � r   t } � � � I  t {�� ���
�� .EVRNfindnull���     ctxt � m   t w � � � � � V n o t e b o o k : " L a m o d a "   i n t i t l e : " L a m o d a   A l l   T e s t "��   � o      ���� 0 
accumnotes 
accumNotes �  � � � r   ~ � � � � n   ~ � � � � 4   ��� �
�� 
cobj � m   � �����  � o   ~ ���� 0 
accumnotes 
accumNotes � o      ���� 0 accn accN �  � � � Z   � � � ��� � � =  � � � � � n   � � � � � 1   � ���
�� 
leng � o   � ����� 0 
accumnotes 
accumNotes � m   � �����   � I  � ����� �
�� .EVRNcrntnull��� ��� null��   � �� � �
�� 
Enhl � m   � � � � � � �  f e w f e w f � �� � �
�� 
Entt � m   � � � � � � �  f e w f w e f � �� ���
�� 
Ennb � m   � � � � � � �  L a m o d a��  ��   � O   � � � � � k   � � � �  � � � r   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
EVhl � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 accn accN��  ��   � o      ���� 0 notehtml noteHTML �  � � � r   � � � � � b   � � � � � m   � � � � � � �  < b o d y > � m   � � � � � � � & f w e f e w f w e f e w f < h r   / > � o      ���� 0 	addstring 	addString �  � � � r   � � � � � n  � � � � � I   � ��� ����� 0 replacestring replaceString �  � � � o   � ����� 0 notehtml noteHTML �  � � � m   � � � � � � �  < b o d y > �  ��� � o   � ����� 0 	addstring 	addString��  ��   �  f   � � � o      ���� 0 edithtml editHTML �  ��� � r   � � � � � o   � ����� 0 edithtml editHTML � l      ����� � n       � � � 1   � ���
�� 
EVhl � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 thenote theNote��  ��  ��   � o   � ����� 0 accn accN �  ��� � l  � ���������  ��  ��  ��   ; m      � ��                                                                                  EVRN  alis    V  Macintosh HD               ӦU�H+   Evernote.app                                                    ��6�z        ����  	                Applications    Ӧ+m      �6�J       'Macintosh HD:Applications: Evernote.app     E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��   9  �� � l  � ��~�}�|�~  �}  �|  �   5 2 , Called directly when invoked from LaunchBar    6 � � � X   C a l l e d   d i r e c t l y   w h e n   i n v o k e d   f r o m   L a u n c h B a r /  ��{ � l     �z�y�x�z  �y  �x  �{       �w � �w   � �v�u
�v .aevtoappnull  �   � ****�u 0 handle_string    �t �s�r�q
�t .aevtoappnull  �   � ****�s  �r      �p �o "�n�m�l�k�j�i�p 0 thetitle theTitle
�o 
dtxt
�n 
appr�m 
�l .sysodlogaskr        TEXT
�k 
rslt
�j 
ttxt�i 0 handle_string  �q �E�O������ O*��,k+ 
 �h 1�g�f�e�h 0 handle_string  �g �d�d   �c�c 0 str  �f   �b�a�`�_�^�]�\�[�Z�Y�X�W�V�b 0 str  �a 0 astid ASTID�` 0 tasklink taskLink�_ 0 taskname taskName�^ 0 	nodetitle 	nodeTitle�] 0 notename noteName�\ 0 notehtml noteHTML�[ 0 mynote myNote�Z 0 
accumnotes 
accumNotes�Y 0 accn accN�X 0 	addstring 	addString�W 0 edithtml editHTML�V 0 thenote theNote # ��U�T I�S e i�R k u  ��Q�P�O ��N�M�L ��K�J � ��I�H�G � � ��F � � ��E
�U 
ascr
�T 
txdl
�S 
citm
�R .sysoexecTEXT���     TEXT
�Q 
Enhl
�P 
Entt
�O 
Ennb�N 
�M .EVRNcrntnull��� ��� null
�L 
EVtg
�K 
EV13
�J .EVRNassnnull���     ****
�I .EVRNfindnull���     ctxt
�H 
cobj
�G 
leng
�F 
EVhl�E 0 replacestring replaceString�e �� ���,E�O���,FO��k/E�O��l/E�O��j %�%�%E�O��%�%E�O�%�%E�O���,FO*�����a  E�O*a a /a �l O*a a /a �l Oa j E�O�a k/E�O�a ,j  *�a �a �a a  Y 7� 2�a k/a ,E�Oa a  %E�O)�a !�m+ "E�O��a k/a ,FUOPUOPascr  ��ޭ