Message-ID: <530EFC98.5090203@redhat.com>
Date: Thu, 27 Feb 2014 09:51:36 +0100
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
> I'm also still wondering why udev can't simply handle quoted names
> with spaces in them.  People have been dealing with this sort of thing
> in shell for years...

We tried that: https://bugzilla.redhat.com/show_bug.cgi?id=736486#c12

And this was not the only request from us to fix something in udev.
But based on previous experience, we concluded that it was just useless
to try spending time with persuading the other side.

If you have enough nerves to argue with them, I'm really and sincerely
wishing you good luck.
-- 
Peter
