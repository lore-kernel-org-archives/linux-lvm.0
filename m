Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8JHVWQ3013145
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:32 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8JHVGs6014147
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:16 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8JHVGnj018139
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:16 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8JHVBcl136570
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:15 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8JHVA2r010916
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:11 -0400
Received: from malahal.localdomain ([9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8JHVA2v010736
	for <linux-lvm@redhat.com>; Fri, 19 Sep 2008 13:31:10 -0400
Date: Fri, 19 Sep 2008 10:31:08 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LV
Message-ID: <20080919173108.GA15000@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
	<1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

Koen Vermeer [koen@vermeer.tv] wrote:
> I tried converting my lv to a mirrored one with --corelog, which worked
> perfectly. However, after a reboot, the mirror is being recreated, which
> takes quite some time and leaves me with a largely unresponsive system.
> 
> Is there some way around this? Would having the log on the master disk
> fix this? If so, does it need it's own PV or LV or neither?

It needs it own PV. Create an extra partition on your master disk and
add the PV tou the volume group.  Then run lvcreate again with out
corelog option. By default the command would create a disklog. You can
also specify where you want your log.

--Malahal.
