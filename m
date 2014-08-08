Message-ID: <53E48CA3.2020500@redhat.com>
Date: Fri, 08 Aug 2014 10:38:59 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
	<53D6085D.2030303@redhat.com>
	<CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
	<53E46F5F.1090709@redhat.com>
	<CAK4r=d4WjS78=rVp3kQx_EzroDMn-nBF8n9_JB4Fo3DU8cm8Ew@mail.gmail.com>
In-Reply-To: <CAK4r=d4WjS78=rVp3kQx_EzroDMn-nBF8n9_JB4Fo3DU8cm8Ew@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How LVM root volumes gets mounted at boot time ?
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
To: Vivek Satpute <vivekonline86@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/08/2014 10:33 AM, Vivek Satpute wrote:
> Thanks a much Peter. This really helped a lot :-)
> 

You're welcome.

BTW, if you want to see the contents of udev database, just call
"udevadm info --export-db" on cmd line. I think only one of
the paths from sysfs dir is mentioned there, but udev (and all clients
using udev via libudev) knows about all the other sysfs aliases for this
device.

-- 
Peter
