Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2HI07j10078
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:00:07 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2HI05V00693
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 12:00:05 -0600
Date: Wed, 17 Mar 2004 12:00:05 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040317120005.C31599@homer.msp.redhat.com>
References: <20040317173637.GA2126@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317173637.GA2126@osdl.org>;
	from dmo@osdl.org on Wed, Mar 17, 2004 at 09:36:38AM -0800
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 17, 2004 at 09:36:38AM -0800, Dave Olien wrote:
> Having redundant copies of meta data is a good thing.  But how about
> allowing the adminstrator to set a limit on the degree of redundancy when
> a VG is created.  You could limit a VG to having for example 10 redundant
> copies.  Then adding more PVs beyond the 10th would encounter less overhead.
> Am I missing something important?

There'll be a VG-level option for this eventually; until then, use the
pvcreate options to say how many copies of metadata you want on each PV.
e.g. pvcreate --metadatacopies 0
[Careful use of the --restorefile option lets you reduce it on a PV already in the VG.]

For complex VGs you should increase the space set aside for metadata too:
  --metadatasize

See the pvcreate man page.
 
Alasdair
-- 
agk@redhat.com
