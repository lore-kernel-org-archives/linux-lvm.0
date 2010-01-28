Message-ID: <4B616F73.9050208@redhat.com>
Date: Thu, 28 Jan 2010 12:05:23 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <20100128095014.GA6725@danisch.de>
In-Reply-To: <20100128095014.GA6725@danisch.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dmsetup and 2.6.31 kernel?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Hadmut Danisch <hadmut@danisch.de>

On 01/28/2010 10:50 AM, Hadmut Danisch wrote:
> With a 2.6.31 kernel (ubuntu) I run into the problem that some dmsetup
> and dmlosetup commands that used to work before do not work anymore. 
> 
> e.g.
> 
> dd if=/dev/zero of=/tmp/testdisk count=1000
> dmsetup create xxxtest --table '0 1000 loop /tmp/testdisk 0'

dm-loop target was never in upstream kernel, it is still available only
as separate kernel patch.

You had patched kernel previously perhaps?

Milan
