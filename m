Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t68CVIn2028278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 8 Jul 2015 08:31:18 -0400
Received: from gw.citecs.de (gw.citecs.de [212.9.189.66])
	by mx1.redhat.com (Postfix) with ESMTP id E7BC83A80F1
	for <linux-lvm@redhat.com>; Wed,  8 Jul 2015 12:31:16 +0000 (UTC)
Date: Wed, 8 Jul 2015 14:31:15 +0200
From: chris <lvm-contact@citecs.de>
Message-ID: <20150708123115.GA21941@app.citecs>
References: <20150707171904.GA24344@app.citecs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20150707171904.GA24344@app.citecs>
Subject: [linux-lvm] [solved] resize2fs results in "permission denied"
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

/dev/mapper contains device nodes, e.g.:
    brw-rw---- 1 root disk 254, 73 Apr 11 23:15 vg_phoesrv2b-lvsnap

those should be symlinks ( except for/dev/mapper/control ):
    vg_phoesrv2b-lvsnap -> ../dm-31

solution:
    rm /dev/mapper/vg_phoesrv2b-lvsnap
    udevadm trigger
