Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F2082F5F
	for <linux-lvm@redhat.com>; Tue,  9 Jul 2019 09:48:02 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 906A5309178C
	for <linux-lvm@redhat.com>; Tue,  9 Jul 2019 09:47:31 +0000 (UTC)
Received: from [10.45.33.53] (helo=SmtpCorp)
	by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
	id 1hkmia-cp4XuU-JA
	for linux-lvm@redhat.com; Tue, 09 Jul 2019 09:47:24 +0000
Received: from [10.54.36.8] (helo=smtp.linagora.com)
	by smtpcorp.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92-S2G) (envelope-from <selbaz@linagora.com>)
	id 1hkmiY-rlZGu1-Qs
	for linux-lvm@redhat.com; Tue, 09 Jul 2019 09:47:23 +0000
Received: from [10.75.71.198] (reverse.completel.net [92.103.166.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.linagora.com (Postfix) with ESMTPSA id 8F876416B8
	for <linux-lvm@redhat.com>; Tue,  9 Jul 2019 11:47:21 +0200 (CEST)
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
Date: Tue, 9 Jul 2019 11:47:20 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------E362975DC95A93848BC22225"
Content-Language: en-US-large
Subject: [linux-lvm] lvdisplay "open" field computing
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

This is a multi-part message in MIME format.
--------------E362975DC95A93848BC22225
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

I am trying to understand how the open field is computed.

On a CentOS6 server, lvdisplay has the following output:

/lvdisplay /dev/mapper/vg_obm-var_spool_imap //
//  --- Logical volume ---//
//  LV Path                /dev/vg_obm/var_spool_imap//
//  LV Name                var_spool_imap//
//  VG Name                vg_obm//
//  LV UUID 0oK7h0-tDZH-eUxE-AyBw-cK7x-U9pS-W7X4Uh//
//  LV Write Access        read/write//
//  LV Creation host, time panoramix.ch-perrens.fr, 2015-01-16 11:03:10 
+0100//
//  LV Status              available//
//  # open                 2//
//  LV Size                1,92 TiB//
//  Current LE             504572//
//  Segments               2//
//  Allocation             inherit//
//  Read ahead sectors     auto//
//  - currently set to     256//
//  Block device           253:3//
/

  And dmsetup show the following info:

/# dmsetup info -c | grep "253" | grep " 3"//
//vg_obm-var_spool_imap                 253   3 L--w    2 2      0 
LVM-1i1v6pEjab2WslaDQRvkf8eLk6QfBW4J0oK7h0tDZHeUxEAyBwcK7xU9pSW7X4Uh/

Could you please give me some hint to understand how "open = 2" is 
obtained ?

Regards/
/

//

-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE


--------------E362975DC95A93848BC22225
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,</p>
    <p>I am trying to understand how the open field is computed.</p>
    <p>On a CentOS6 server, lvdisplay has the following output:</p>
    <p><i>lvdisplay /dev/mapper/vg_obm-var_spool_imap </i><i><br>
      </i><i>  --- Logical volume ---</i><i><br>
      </i><i>  LV Path                /dev/vg_obm/var_spool_imap</i><i><br>
      </i><i>  LV Name                var_spool_imap</i><i><br>
      </i><i>  VG Name                vg_obm</i><i><br>
      </i><i>  LV UUID               
        0oK7h0-tDZH-eUxE-AyBw-cK7x-U9pS-W7X4Uh</i><i><br>
      </i><i>  LV Write Access        read/write</i><i><br>
      </i><i>  LV Creation host, time panoramix.ch-perrens.fr,
        2015-01-16 11:03:10 +0100</i><i><br>
      </i><i>  LV Status              available</i><i><br>
      </i><i>  # open                 2</i><i><br>
      </i><i>  LV Size                1,92 TiB</i><i><br>
      </i><i>  Current LE             504572</i><i><br>
      </i><i>  Segments               2</i><i><br>
      </i><i>  Allocation             inherit</i><i><br>
      </i><i>  Read ahead sectors     auto</i><i><br>
      </i><i>  - currently set to     256</i><i><br>
      </i><i>  Block device           253:3</i><i><br>
      </i><br>
    </p>
    <p> And dmsetup show the following info:</p>
    <p><i># dmsetup info -c | grep "253" | grep " 3"</i><i><br>
      </i><i>vg_obm-var_spool_imap                 253   3 L--w    2   
        2      0
        LVM-1i1v6pEjab2WslaDQRvkf8eLk6QfBW4J0oK7h0tDZHeUxEAyBwcK7xU9pSW7X4Uh</i></p>
    <p>Could you please give me some hint to understand how "open = 2"
      is obtained ?</p>
    <p>Regards<i><br>
      </i></p>
    <p><i></i><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE</pre>
  </body>
</html>

--------------E362975DC95A93848BC22225--
