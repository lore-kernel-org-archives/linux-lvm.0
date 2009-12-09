Message-ID: <4B200615.1010702@redhat.com>
Date: Wed, 09 Dec 2009 21:18:29 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] kernel panic on lvcreate
References: <14440243.291260370842741.JavaMail.javamailuser@localhost>
In-Reply-To: <14440243.291260370842741.JavaMail.javamailuser@localhost>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christopher Hawkins <chawkins@bplinux.com>

On 12/09/2009 04:00 PM, Christopher Hawkins wrote:
> 
> After some time I revisited this issue on a freshly installed Centos 5.4 box, latest kernel (2.6.18-164.6.1.el5 )
> and the panic is still reproducible. Any time I create a snapshot of the root filesystem, kernel panics.

I guess it is already reported here https://bugzilla.redhat.com/show_bug.cgi?id=539328
so please watch this bugzilla.

Milan
--
mbroz@redhat.com
