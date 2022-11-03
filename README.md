Os arquivos contidos usam BootStrap para o front-end, para ações dinâmicas na pagina usa-se javascript, porém, a grande maioria do processamento é feito pelo servlet java.

Quando não logado o usuário so pode acessar home, ver os posts e fazer login ou cadastro.
O usuário comum cadastrado pode ainda comentar e seu nome aparece no menu com direcionamento pra home.
Com usuário administrativo ainda se tem acesso ao painel de moderador que pode autorizar os comentarios comuns, e pode deletar ou modificar posts. Estes usuários moderadores tambem comentam sem necessitar de autorização em seus comentários.

Vale lembrar que não é possivel editar comentário e remove-los depois de aceitos pois não eram requisitos funcionais do programa e a linha ficava bem tenuosa sobre quem tem autorização a fazer isso.

Quanto a usuarios, o login se faz com email e senha, podem ser cadastrados mais, porém ja se tem os seguintes

<table><thead><th>Email</th><th>Senha</th><th>Nível</th></thead>
<tbody>
    <tr>
        <td>admin@sys</td>
        <td>password</td>
        <td>moderador</td>
    </tr>
    <tr>
        <td>admin2@sys</td>
        <td>drowssap</td>
        <td>moderador</td>
    </tr>
    <tr>
        <td>example@etc</td>
        <td>senha123</td>
        <td>comum</td>
    </tr>
    <tr>
        <td>user@tech</td>
        <td>senhacomplexa</td>
        <td>comum</td>
    </tr>
</tbody>
</table>

Para as tableas de postagens e comentarios os aquivos dados_postagens.csv and dados_comentários.csv sao, respectivamente
, csvs preparados com dados bases que podem ser usados pra teste, a navegação é funcional e podem ser criadas várias paginas de postagem.

Em caso de duvida para inserção dos csv's nas tabelas, basta executar tanto DDl.sql e usuarios.sql, nessa ordem, e após isso,
dentro do <b>MySQL Workbench</b> clicar com o botão direito no nome da tabela que quer inserir os dados e selecionar 
<b>Table Data Import Wizard</b>, dai basta selecionar os aquivos csv's corretos e dar next no processo.