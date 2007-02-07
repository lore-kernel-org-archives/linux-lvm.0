Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17JPKdV018886
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 14:25:20 -0500
Received: from coraid.com (none@ns1.coraid.com [65.14.39.133])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l17JPCOL009994
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 14:25:15 -0500
Date: Wed, 7 Feb 2007 14:21:22 -0500
From: "Ed L. Cashin" <ecashin@coraid.com>
Message-ID: <20070207192122.GE7006@coraid.com>
References: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
Subject: [linux-lvm] Re: Strange LVM Error With AoE Disks
Reply-To: support@coraid.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Jayson Vantuyl <jvantuyl@engineyard.com>
Cc: Coraid Support <support@coraid.com>, Linux LVM List <linux-lvm@redhat.com>

On Wed, Feb 07, 2007 at 08:16:23AM -0600, Jayson Vantuyl wrote:
...
> All of the nodes show the following errors in syslog:
> 
> Feb  7 06:09:36 ey00-00 lvm[4869]: Couldn't find all physical volumes  
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid  
> '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
...
> Even more bizarre, pvscan finds them just fine on all nodes.
> 
> The only thing I can note about these devices that is particularly  
> different is that they appear to be using minor numbers above 256.   
...
> Is there a known problem with LVM or CLVM related to large device  
> minor numbers?

Hello, Jayson Vantuyl.  I just wanted to chime in to say that we are
not aware of such a problem, but we wouldn't necessarily have heard
about it, since the population using CLVM on AoE is probably not large
yet.  (Many use LVM, but I haven't heard much feedback from folks
using CLVM.)

I haven't looked at the CLVM sources really recently, but we have seen
the large minor device number problem before in older versions of LVM
where glibc's macros are used to work with the major and minor parts
that are encoded within device numbers.  So if there's a problem, it
might be possible to find it by looking for those macros.

-- 
  Ed L Cashin <ecashin@coraid.com>
