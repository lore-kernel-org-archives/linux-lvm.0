Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i17Mika19632
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:44:46 -0500
Received: from gw.uk.sistina.com (gw.uk.sistina.com [62.172.100.98])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i17Mikb26245
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:44:46 -0500
Received: from agk by gw.uk.sistina.com with local (Exim 3.12 #1 (Debian))
	id 1ApbBt-0001cb-00
	for <linux-lvm@redhat.com>; Sat, 07 Feb 2004 22:44:45 +0000
From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] root on lvm2 on raid5 problem... kernel 2.6.x
Message-ID: <20040207224445.Z1170@uk.sistina.com>
References: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>; from Geoffrey.Weber@mcleodusa.com on Thu, Feb 05, 2004 at 02:37:44PM -0600
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb  7 17:44:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Also if things are read only, you might want to put /dev/mapper on 
tmpfs to cope with device numbers changing:
  mount -t tmpfs tmpfs /dev/mapper/

Alasdair (testing list 'From:' line)
