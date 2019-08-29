Date: Thu, 29 Aug 2019 09:37:59 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190829143759.GA22659@redhat.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Martin Wilck <mwilck@suse.de>

On Thu, Aug 29, 2019 at 01:52:48PM +0000, Heming Zhao wrote:
> fedora-server (kernel: 5.2.9-200  with rpmbuild: lvm2-2.03.05)
> event_activation=1: 2min 3.661s
> event_activation=0: 1min 57.478s

We've recently been looking at other similar cases, although not with the
unusual partitioning scheme you have.  Could you send the output of
systemctl status on each of the lvm2-pvscan services?  Also, try setting
obtain_device_list_from_udev=0 in lvm.conf to avoid some delays from udev.
Thanks, Dave
