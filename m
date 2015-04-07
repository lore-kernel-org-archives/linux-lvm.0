Received: from tasleson.csb (vpn-239-196.phx2.redhat.com [10.3.239.196])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t37LtTxU031303
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 17:55:30 -0400
Message-ID: <55245251.1040302@redhat.com>
Date: Tue, 07 Apr 2015 16:55:29 -0500
From: Tony Asleson <tasleson@redhat.com>
MIME-Version: 1.0
References: <1428440042-13679-1-git-send-email-tasleson@redhat.com>
	<20150407210454.GB32694@agk-dp.fab.redhat.com>
In-Reply-To: <20150407210454.GB32694@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 1/2] python: Make lv
	addTag/removeTag	persistant
Reply-To: tasleson@redhat.com,
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
To: linux-lvm@redhat.com

On 04/07/2015 04:04 PM, Alasdair G Kergon wrote:
> On Tue, Apr 07, 2015 at 03:54:01PM -0500, Tony Asleson wrote:
>> +    if (lvm_vg_write(self->parent_vgobj->vg) == -1)
> 
> In the end, you may need to make this configurable for the library user
> (consistently over all functions).
> Some users will want to set lots of properties on lots of LVs followed
> by a single atomic commit for them all; whereas other users will want to
> commit each change independently.

If a user wants that level of functionality they can use the C library
interface.  The python interface has only offered the mode where changes
are auto committed.

This is a bug fix to make the lv tag add/remove persist as expected.

-Tony
