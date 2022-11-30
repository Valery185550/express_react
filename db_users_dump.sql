PGDMP     9    "            
    z            users    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399    users    DATABASE     y   CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE users;
                postgres    false            �            1259    16435    bonds    TABLE     o   CREATE TABLE public.bonds (
    id integer NOT NULL,
    subscriber_id integer,
    subscription_id integer
);
    DROP TABLE public.bonds;
       public         heap    postgres    false            �            1259    16419    subscribers    TABLE     �   CREATE TABLE public.subscribers (
    id integer NOT NULL,
    first_name character(30) NOT NULL,
    gender character(6),
    CONSTRAINT subscribers_gender_check CHECK (((gender = 'male'::bpchar) OR (gender = 'female'::bpchar)))
);
    DROP TABLE public.subscribers;
       public         heap    postgres    false            �            1259    16418    subscribers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.subscribers_id_seq;
       public          postgres    false    215                       0    0    subscribers_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.subscribers_id_seq OWNED BY public.subscribers.id;
          public          postgres    false    214            �            1259    16434     subscribers_subscriptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscribers_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.subscribers_subscriptions_id_seq;
       public          postgres    false    219                       0    0     subscribers_subscriptions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.subscribers_subscriptions_id_seq OWNED BY public.bonds.id;
          public          postgres    false    218            �            1259    16427    subscriptions    TABLE     �   CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    first_name character(30) NOT NULL,
    gender character(6),
    CONSTRAINT subscriptions_gender_check CHECK (((gender = 'male'::bpchar) OR (gender = 'female'::bpchar)))
);
 !   DROP TABLE public.subscriptions;
       public         heap    postgres    false            �            1259    16426    subscriptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.subscriptions_id_seq;
       public          postgres    false    217                       0    0    subscriptions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;
          public          postgres    false    216            q           2604    16438    bonds id    DEFAULT     x   ALTER TABLE ONLY public.bonds ALTER COLUMN id SET DEFAULT nextval('public.subscribers_subscriptions_id_seq'::regclass);
 7   ALTER TABLE public.bonds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            o           2604    16422    subscribers id    DEFAULT     p   ALTER TABLE ONLY public.subscribers ALTER COLUMN id SET DEFAULT nextval('public.subscribers_id_seq'::regclass);
 =   ALTER TABLE public.subscribers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            p           2604    16430    subscriptions id    DEFAULT     t   ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);
 ?   ALTER TABLE public.subscriptions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16435    bonds 
   TABLE DATA           C   COPY public.bonds (id, subscriber_id, subscription_id) FROM stdin;
    public          postgres    false    219   �                 0    16419    subscribers 
   TABLE DATA           =   COPY public.subscribers (id, first_name, gender) FROM stdin;
    public          postgres    false    215   :*                 0    16427    subscriptions 
   TABLE DATA           ?   COPY public.subscriptions (id, first_name, gender) FROM stdin;
    public          postgres    false    217   �.                  0    0    subscribers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.subscribers_id_seq', 213, true);
          public          postgres    false    214                       0    0     subscribers_subscriptions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.subscribers_subscriptions_id_seq', 669, true);
          public          postgres    false    218                       0    0    subscriptions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);
          public          postgres    false    216            u           2606    16425    subscribers subscribers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            postgres    false    215            y           2606    16440 $   bonds subscribers_subscriptions_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.bonds
    ADD CONSTRAINT subscribers_subscriptions_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.bonds DROP CONSTRAINT subscribers_subscriptions_pkey;
       public            postgres    false    219            w           2606    16433     subscriptions subscriptions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public            postgres    false    217            z           2606    16441 2   bonds subscribers_subscriptions_subscriber_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bonds
    ADD CONSTRAINT subscribers_subscriptions_subscriber_id_fkey FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(id);
 \   ALTER TABLE ONLY public.bonds DROP CONSTRAINT subscribers_subscriptions_subscriber_id_fkey;
       public          postgres    false    3189    219    215            {           2606    16446 4   bonds subscribers_subscriptions_subscription_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bonds
    ADD CONSTRAINT subscribers_subscriptions_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);
 ^   ALTER TABLE ONLY public.bonds DROP CONSTRAINT subscribers_subscriptions_subscription_id_fkey;
       public          postgres    false    217    3191    219               t  x�-�ّ�0��`�ě�e�c�U�[�)�@��_���ԗ�~��_�R�Z���Sۯ��|j���O]�����-����1���Y�,��[�i�ϲ���o���:��i�G�/ϧ���h��`�_i��������·�[O��1���ӻ���Q�_���L,`���!�ԱO�R��^�(��30�K�g-��3zh�gh�Ǜ3�/�V��g���3Nh��|Cbu��3k`?�Vfg�3G`=s|�~�f��1�yB�=���Ml�*���*��,̳�Y]<cYX��[K�-�N����̬w	���Z�٘_�Σ.�7{&���b��^�џ�C�<��/�W`wOO�W�/N�����`�����%�^g����sN���}�����P�f�����.X�iIS����V�-9����)n�\^�[E�QpR�}.x�ݥ%�ٖ��=~>oh'��>[4�5�G=�����1ȶ��Iq[��ZXpÅ���Cd-�MC��"$
�$�k".���6�L6a&��b�^b��G��qFhb���|X/2	�]����l0E�?b�~x�%�,1��� 6���(A������f��~;��+�W���QM�`���S6c#��C�y��pq�B<��OĳD��⑆�"�Ӡ{EL+)�$�Y{	*�5#D�	��l�$������Lt穯/Q%�����#�18�m�;�UI$�!��>s�q--�El�N��6������D��X.D��� &	�(��A3o��&�B�O}Z�P�yÙpg��!�'�h����4���H�V^�d0"^<"=�\�V���c��XP���P��d���԰D�,-ȶV�8̯teZ�f��$�7iI�ȳH��ξV4���bED"�"
�$�Ո}���"�Zхe"��D�TtA'�1�)��M����M����B5D֭���wWr$/TT!��Q�����RYtA�>����h�h�,< ����!3B �IQ9�
A�T&+8}I�f(L��5E���|%���CW����T�t+IH��/�G$ 	�.��f�R�tVb�Xa1��mI�tYqm��Q[�$��P�ّО�o�*�k˶I�-B��.iHSb��Q+5��h�4s����73=�[�AT�:�b�V"�M 0� a�h+@��ĝ=�$��� O1#�l�q�'�ׂ�`�"\t�q�b��D�H`�[�5\>�~��Lڈj�)5�Z�6��ɮ6�:H�IP�����n%���,<E�ْ"��m�ټf����P����$�%!5��0cO�ؒ��5axQ*�gO�٬�d<�Y��V�]��ڃ.�e��=k�w&<ZM�E�W�u��z�:��3;(��m)�pJ�o-x����gJ�fu#Z䯠�r��)��	�n-%̛�����Y�����pɷ-\�o5-�ö��I4�����Ҿܒ��h�fy/�CI�ifq���F�L!�L�9-�~\����������^���M2�=3�Y.��m��#7�ɮ��)�e��~�|w~�"����u�7�ג@ޜ�Z2�{G�pu���>o��-�^�Tm�XR�öYa�h��b�\���*b"��6��>j���az���޷�q��mϠ�ۉ�{:��8oLFǮ(^�3Z�X I��)t�v�NN���"�¡�yQc+�yG,n"i��Z��oN ���$�{~|��4�Wx]f���?�x�fW��{θ5�T����dGqS|�>Ʀ�Ǝ>虤hg^~mc�#���&���|L��=g�W���w�Օ��rM�o]�ݔ����@ql������5lW��RAv�� -rJ��$qu���A����}�K	�J�����Ta�'���{I�P���>��{��Z�\t=� CV_D��^4� ��>rN�Q��r�SeW\b{�K�%g��u�%��v����ˣ���Ҟɬ]����Ąq %&L�J�c�0�yW�ݮĄ�����nu��ˌ��=�id�� ��물�\pt�$��"�0j��N�c]uI��	k/\N�]y5a���fU��b�+.����x���g��Ϻ���\Hx��j���$kw�Ed�jKhLKq�n�.���[�\9P_�QwM�������N�1���$�4�\���ń�}�>�ª_^���m����1���s��se=9!#j��m%Hܠţ��EZ�.7)C��(�k+X����F�ڝfrSJ'���`K����E�`��k�p�>����E�ݗwmA�\އ��^�����l���]ܩ?al�\��bi�ȷ{?M�#���3T��@�7q`z��u�7:���q�#�j#�#�~��ѳ�)[���]8ދ���C�����i#w�#˙��i��xoV����ޗ�mNXTv��n0W����}�^n/�#e�e �E�;sG�p
�׋����5r.�%.����*��~��]�}�d�˔36�4n8I��kdb�kc��������`��S�gߚd�^�|���6&����[ѫ`;5������^��w����P~<���k����m���P�&�q�Ez9�"�+<�6�\�R�}?�p
�d˩�[0Nu'�`�f>�M�ڙkg}��$���c�-�c�+2�4�{88���Te����
sJKq�JLW.�Z�I�G���w.��l��5m3?Ƽ*#FӪ�U��	Ѷ�!�mqTTc�B]��mX�j*��&���,�͋����=3ζ?f"�|��ng9���c��Ƕ�ˑ����c��e����Lʙ}]���������4}�����\dSG�������/2/0�d�9r��J��Qs�Dh�G�|z�(S2��^�4�N#�^����Ȝ��z�5��	h�y�����^k��I�U���J��X�EH������rgܿ�����y����D�         �  x����n�FE�������	l`<O2d�1fdhP��}��Hj�n^m�9h���n�*2}������wU[�hz8V�7R��7��tmi�g��ۡ�?yz����y[_�ӏ�.ldZ/Ц:���z<�D�c=�?�}m�������V/��e�[���S�o�ϞAK����/ez��/�P����+pˊ�?��r#Q+z�v= ��xN�ǣǛ�����>��km�� t`^iO����:�A���١��IK*:L���w���9�c�O�����AN�6c��˞A�HzL�:���_-=&�Aa=V�v��-�f���8��B+�>6���A+�U����{)	�]���1��3��a#��6�J������:sNW��[0�K��t��:�~�E�o�M�N+&�ry�g�^��jz�v�x<ޮU�	t����R��` #�G�VTo()A��,�Aˁ�:�\��N*89�a��^�2ު���` ma�`�	,Q�;��:Ƞ�D�T�������Z�TZpQ�=�
�31�U!J�9 ɕ���A�ItRI��f���H��:t`*$v)��#Ez����;���g�gX)�Oa�"*�|�_�LDVT]VIV���Vl�2r�h� ^�@����"���DJ��C���dE�����d0Ǚ5�X�FNi_�eR�Z�]��Wc�;j~]��.d�V��Wde�9����� v����u�`�������~�����:�@�d��5��:���T�uՓ�B�A��ޖ�F3�4B�E�[𜀍��,�l":�4	l��*!;Ö�S�lT�1*i�,�K֡�z�ƝgP�ۈUm�]v
�C�1h��iTm���,��i�k]���m:w֬�8'Z���;;�\Ȁ�7�Q�n]�	%��E�u^���K^<C[r���~W̎���c��d?�F&4����R�zt�;@i�Au>X�4"���u��
8p��It��Q�Ϻ0@�"���Q�krDG>��*K���������1��I�D��M]E]�zԽ��D뤁�eх}ݶ�[��4�m�=CT19�#����,d ��"Zߓx��K�>?�jh����L2Xߵ���y"Y+F�V�b���+ ���@�*���U=�fu��� ɠ�kF?���A��pʼ�D������_��w�         �  x����n�FE�������	l`<O2d�1fdhP��}��Hj�n^m�9h���n�*2}������wU[�hz8V�7R��7��tmi�g��ۡ�?yz����y[_�ӏ�.ldZ/Ц:���z<�D�c=�?�}m�������V/��e�[���S�o�ϞAK����/ez��/�P����+pˊ�?��r#Q+z�v= ��xN�ǣǛ�����>��km�� t`^iO����:�A���١��IK*:L���w���9�c�O�����AN�6c��˞A�HzL�:���_-=&�Aa=V�v��-�f���8��B+�>6���A+�U����{)	�]���1��3��a#��6�J������:sNW��[0�K��t��:�~�E�o�M�N+&�ry�g�^��jz�v�x<ޮU�	t����R��` #�G�VTo()A��,�Aˁ�:�\��N*89�a��^�2ު���` ma�`�	,Q�;��:Ƞ�D�T�������Z�TZpQ�=�
�31�U!J�9 ɕ���A�ItRI��f���H��:t`*$v)��#Ez����;���g�gX)�Oa�"*�|�_�LDVT]VIV���Vl�2r�h� ^�@����"���DJ��C���dE�����d0Ǚ5�X�FNi_�eR�Z�]��Wc�;j~]��.d�V��Wde�9����� v����u�`�������~�����:�@�d��5��:���T�uՓ�B�A��ޖ�F3�4B�E�[𜀍��,�l":�4	l��*!;Ö�S�lT�1*i�,�K֡�z�ƝgP�ۈUm�]v
�C�1h��iTm���,��i�k]���m:w֬�8'Z���;;�\Ȁ�7�Q�n]�	%��E�u^���K^<C[r���~W̎���c��d?�F&4����R�zt�;@i�Au>X�4"���u��
8p��It��Q�Ϻ0@�"���Q�krDG>��*K���������1��I�D��M]E]�zԽ��D뤁�eх}ݶ�[��4�m�=CT19�#����,d ��"Zߓx��K�>?�jh����L2Xߵ���y"Y+F�V�b���+ ���@�*���U=�fu��� ɠ�kF?���A��pʼ�D������_��w�     