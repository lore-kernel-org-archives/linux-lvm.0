Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p14Fs4Dc003733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2011 10:54:05 -0500
Date: Fri, 4 Feb 2011 10:54:04 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110204155403.GD1535@redhat.com>
References: <4D4C0933.80107@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D4C0933.80107@redhat.com>
Subject: Re: [linux-lvm] lvm2: zeroing free space
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

On Fri, Feb 04 2011 at  9:12am -0500,
Bryn M. Reeves <bmr@redhat.com> wrote:

> Hi Folks,
> 
> Recently had a query from someone using an array supporting thin provisioning
> with zero page reclaim[1].
> 
> They wanted a method to write zeros to all the unallocated space in a VG to
> trigger a reclaim of unused regions in the VG's PVs.
> 
> My suggestion was to lvcreate a -l100%FREE LV named "filler" and overwrite it
> from /dev/zero.
> 
> It seems like this might something a lot of users want as this functionality
> gets to be more common.
> 
> I wondered if it could be worth adding a script to automate this or even an
> option to vgchange (e.g. --zero-free-space)?
> 
> Didn't have time to try putting anything together yet but it seems such a
> feature could be useful.

Do these HDS arrays also support discard?  Would seem to me that issuing
discards for the free space would be better (more standard) than writing 
zeros to accomplish the same.

This variant would be: vgchange --discard-free-space

Mike
