Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t67HJ7HB021587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 7 Jul 2015 13:19:07 -0400
Received: from gw.citecs.de (gw.citecs.de [212.9.189.66])
	by mx1.redhat.com (Postfix) with ESMTP id 09C792F06
	for <linux-lvm@redhat.com>; Tue,  7 Jul 2015 17:19:06 +0000 (UTC)
Date: Tue, 7 Jul 2015 19:19:04 +0200
From: chris <lvm-contact@citecs.de>
Message-ID: <20150707171904.GA24344@app.citecs>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] resize2fs results in "permission denied"
Reply-To: chris <lvm-contact@citecs.de>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: chris <lvm-contact@citecs.de>

problem:
	after successful "lvextend -L +15G" , resize2fs gets "permission denied". 

strace says: 

	open("/dev/mapper/vg_phoesrv2b-varlog", O_RDONLY|O_EXCL) = -1 EACCES (Permission denied)
	open("/dev/mapper/vg_phoesrv2b-varlog", O_RDWR) = -1 EACCES (Permission denied)

ls: 
	brw-rw---- 1 root disk 254, 44 Apr 11 23:15 /dev/mapper/vg_phoesrv2b-varlog 

lvs: 
	varlog     vg_phoesrv2b -wi-ao--  25,00g

system:
	debian 7.8
	resize2fs 1.42.5 (29-Jul-2012)
	lvm2 2.02.95-8
	linux 3.18.9
	
never seen that one. what's going on? 
