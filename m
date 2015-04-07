Received: from tasleson.csb (vpn-239-196.phx2.redhat.com [10.3.239.196])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t37KsFq2020464
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2015 16:54:15 -0400
Message-ID: <552443F7.8080207@redhat.com>
Date: Tue, 07 Apr 2015 15:54:15 -0500
From: Tony Asleson <tasleson@redhat.com>
MIME-Version: 1.0
References: <CAKEq5nvhrnJ9Cir70jb8uqmcV42AT2sqGh_qNpo7-rCAu4Gd-A@mail.gmail.com>
In-Reply-To: <CAKEq5nvhrnJ9Cir70jb8uqmcV42AT2sqGh_qNpo7-rCAu4Gd-A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Tagging LVs with Python Bindings
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

On 04/06/2015 12:08 PM, Michael Schmidt wrote:
> Hi all,
> 
> While working with the Python bindings and attempting to add tags to
> logical volume lvm_vg_write seems not to be called. This means if add_tag
> is called and the virtual group handle is closed the tags disappear. 

Thanks for reporting this!

> The
> action in _liblvm_lvm_vg_add_tag solves this by calling lvm_vg_write on the
> handle itself. Since the lv handle does not seem to have access to it's vg
> handle I added a method to the vg just to trigger a write:

The python bindings were written with the expectation that the state
changes would be saved automatically.  So adding a call for the user to
issue a write on the vg goes against the overall design.

...

> My question is: is there a better way to accomplish this?

In this case we should issue the lvm_vg_write in the add/remove tag
calls for the lv.  The lv structure has a pointer to the parent vg in
the python binding.

I submitted a patch which does this and improves the unit test to test
for this.

Any bugzilla submitted for this?

Regards,
Tony
