Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8PGfVin017947
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 17:41:31 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CBFc3-0008Cu-Q4
	for linux-lvm@redhat.com; Sat, 25 Sep 2004 17:41:31 +0100
Date: Sat, 25 Sep 2004 17:41:31 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM UUIDs are not UUIDs!?
Message-ID: <20040925164131.GM11810@agk.surrey.redhat.com>
References: <20040923084741.GA5658@engelschall.com>
	<1095959414.26438.27.camel@tesuji.nac.uci.edu>
	<20040923175322.GA6110@engelschall.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040923175322.GA6110@engelschall.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Sep 23, 2004 at 07:53:22PM +0200, Ralf S. Engelschall wrote:
> because that's already (since many years) the official name of the
> ids from DCE 1.1 and ISO/IEC 11578:1996. 

LVM2 has inherited this from LVM which calls them UUIDs.
It would cause too much confusion to change this terminology.

But I'm willing to accept an LVM2 patch to uuid.c etc. which 
switches to generating compliant ones *provided that* it leaves 
the tools fully backwards- and forwards-compatible and does not 
introduce additional external dependencies by default.

But I have no time to spend on this myself in the forseeable 
future, so before it gets applied, a patch will need to be
self-evidently correct (by reading it incl. comments) and have
evidence of thorough testing incl.  PV created by LVM1, UUID displayed
correctly in old-format using the patched code; PV created with the
patched code in lvm1 format, displayed correctly by LVM1 tools; PV
created with patched code in lvm2 format displayed and processed
sensibly by unpatched lvm2 tools etc.  Also affects tools that take
--uuid argument [both formats to be acceptable]; and vgexport/import,
vgcfgbackup/restore, vgconvert, and even lvchange -a will need careful
testing (it relies on VG and LV UUIDs), though retaining the existing 
length internally and introducing mapping to and from this might be a
good way to limit the amount of testing necessary.

Alasdair
-- 
agk@redhat.com
