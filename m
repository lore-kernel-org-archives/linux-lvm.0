Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j4HDxOMO011763
	for <linux-lvm@redhat.com>; Tue, 17 May 2005 14:59:24 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DY2bT-0005xN-VG
	for linux-lvm@redhat.com; Tue, 17 May 2005 14:59:24 +0100
Date: Tue, 17 May 2005 14:59:23 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvdisplay
Message-ID: <20050517135923.GN15809@agk.surrey.redhat.com>
References: <ADC8F7AA316AF74EBEC87590CCDA616204F882DA@PDBEX02E.pdb.fsc.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ADC8F7AA316AF74EBEC87590CCDA616204F882DA@PDBEX02E.pdb.fsc.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, May 17, 2005 at 10:53:46AM +0200, Dirk.Laurenz@fujitsu-siemens.com wrote:
> 	pvdisplay -m /dev/sdd1
 
For now:

  lvs -o +devices | grep /dev/sdd1
(Number in brackets is the starting extent on the device.)
 or lvdisplay --maps for the verbose equivalent.

Alasdair
-- 
agk@redhat.com
