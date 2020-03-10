Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 779262166B29
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2020 19:25:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BD8E1019E0D
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2020 19:25:40 +0000 (UTC)
Received: from [134.119.228.4] (helo=webmailfront-cgn01.ispgateway.de)
	by smtprelay04.ispgateway.de with esmtpsa
	(TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.3)
	(envelope-from <maiski@maiski.net>) id 1jBkVT-00060k-Es
	for linux-lvm@redhat.com; Tue, 10 Mar 2020 20:25:35 +0100
Date: Tue, 10 Mar 2020 20:25:35 +0100
Message-ID: <20200310202535.Horde.eID8hNJGj7q-b0zb4iXm6A3@webmail.df.eu>
From: maiski@maiski.net
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_kvLpun_OdXH-Tsowrb53pg4"
Subject: [linux-lvm] probable lvm thin_pool exhaustion
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This message is in MIME format.
--=_kvLpun_OdXH-Tsowrb53pg4
Content-Type: text/plain; charset=UTF-8; format=flowed; delsp=Yes
Content-Description: Plaintext Message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello all,

i am a total newbie besides the general knowledge of lvm.
With this disclaimer written I have the following problem,
which may def need some expert knowledge of lvm, because i couldn't
find solutions online for now :/

I am booting my system (in my case is Qubes, but I suppose that does not
matter at this point)
and after entering my luks password get to the dracut emergency shell.
/"Check for pool qubes-dom/pool00 failed (status:1). Manual repair
required!"/
The only aclive lv is qubes_dom0/swap.
All the others are inactive.

step 1:
/lvm vgscan vgchange -ay
lvm lvconvert --repair qubes_dom0/pool00/
Result:
/using default stripesize 64.00 KiB.
Terminate called after throwing an instance of 'std::runtime_error'
what(): transaction_manager::new_block() couldn't allocate new block
Child 7212 exited abnormally
Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed
(status:1). Manual repair required!/

step 2:
since i suspect that my lvm is full (though it does mark 15 g as free)
i tried the following changes in the /etc/lvm/lvm.conf
thin_pool_autoextend_threshold =3D 80
thin_pool_autoextend_percent =3D 2 (Since my the pvs output gives PSize:
465.56g Pfree 15.78g, I set this to 2% to be overly cautious not to extend
beyond the 15 G marked as free, since idk)
auto_activation_volume_list =3D to hold the group, root, pool00, swap and a
vm that would like to delete to free some space
volume_list =3D the same as auto_activation_volume_list

and tried step 1 again, did not work, got the same result as above with
qubes_swap as active only

step 3 tried
/lvextend -L+1G qubes_dom0/pool00_tmeta/
Result:
/metadata reference count differ for block xxxxxx, expected 0, but got 1
...
Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!/

Since I do not know my way around lvm, what do you think, would be the best
way out of this?
Adding another external PV? migrating to a bigger PV?
I did not play with backup or achive out of fear to loose any unbackuped
data which happens to be a bit :|
Any help will be highly appreciated!

Thanks in advance,
m

--=_kvLpun_OdXH-Tsowrb53pg4
Content-Type: text/html; charset=UTF-8
Content-Description: HTML Message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<body style=3D"font-family:Arial;font-size:14px">Hello all,<br />
<br />
i am a total newbie besides the general knowledge of lvm.<br />
With this disclaimer written I have the following problem,<br />
which may def need some expert knowledge of lvm, because i couldn't<br />
find solutions online for now :/<br />
<br />
I am booting my system (in my case is Qubes, but I suppose that does not ma=
tter at this point)<br />
and after entering my luks password get to the dracut emergency shell.<br /=
>
<em>"Check for pool qubes-dom/pool00 failed (status:1). Manual repair requi=
red!"</em><br />
The only aclive lv is qubes_dom0/swap.<br />
All the others are inactive.<br />
<br />
step 1:<br />
<em>lvm vgscan vgchange -ay<br />
lvm lvconvert --repair qubes_dom0/pool00</em><br />
Result:<br />
<em>using default stripesize 64.00 KiB.<br />
Terminate called after throwing an instance of 'std::runtime_error'<br />
what(): transaction_manager::new_block() couldn't allocate new block<br />
Child 7212 exited abnormally<br />
Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed (statu=
s:1). Manual repair required!</em><br />
<br />
step 2:<br />
since i suspect that my lvm is full (though it does mark 15 g as free)<br /=
>
i tried the following changes in the /etc/lvm/lvm.conf<br />
thin_pool_autoextend_threshold =3D 80<br />
thin_pool_autoextend_percent =3D 2 (Since my the pvs output gives PSize: 46=
5.56g Pfree 15.78g, I set this to 2% to be overly cautious not to extend be=
yond the 15 G marked as free, since idk)<br />
auto_activation_volume_list =3D to hold the group, root, pool00, swap and a=
 vm that would like to delete to free some space<br />
volume_list =3D the same as auto_activation_volume_list<br />
<br />
and tried step 1 again, did not work, got the same result as above with qub=
es_swap as active only<br />
<br />
step 3 tried<br />
<em>lvextend -L+1G qubes_dom0/pool00_tmeta</em><br />
Result:<br />
<em>metadata reference count differ for block xxxxxx, expected 0, but got 1=
 ...<br />
Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!<=
/em><br />
<br />
<br />
Since I do not know my way around lvm, what do you think, would be the best=
 way out of this?<br />
Adding another external PV? migrating to a bigger PV?<br />
I did not play with backup or achive out of fear to loose any unbackuped da=
ta which happens to be a bit :|<br />
Any help will be highly appreciated!<br />
<br />
Thanks in advance,<br />
m<br />
<br />
</body>
--=_kvLpun_OdXH-Tsowrb53pg4--
