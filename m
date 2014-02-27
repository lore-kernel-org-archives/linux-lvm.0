Message-ID: <530F008E.1070003@redhat.com>
Date: Thu, 27 Feb 2014 10:08:30 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com>
	<530E30B4.6020505@redhat.com>	<530E3464.3050606@ubuntu.com>
	<530E3CAA.1070308@redhat.com>	<530E541C.9040001@ubuntu.com>
	<530E5F36.5070002@redhat.com> <530E67E9.9060005@ubuntu.com>
In-Reply-To: <530E67E9.9060005@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdevmapper's handling of devices with spaces in
 the name
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
To: psusi@ubuntu.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 02/26/2014 11:17 PM, Phillip Susi wrote:
> I'm trying to fix parted to not fail on such devices.  As I said
> originally it fails because it calls dm_task_get_name() to find out
> the true /dev/mapper/ name of the device, so that it can add the
> partition number to it and be able to open the partition.  Now that I
> look at the comment in the headers, it sounds like perhaps it just
> should be using dm_task_get_name_mangled() instead.

Yes, you can call that fn to get the name in its actual "mangled" form
as it appears in /dev/mapper.

-- 
Peter
