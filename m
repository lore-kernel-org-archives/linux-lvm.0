Return-Path: <prj@multivac.cwru.edu>
Subject: Re: [linux-lvm] lvm on root
References: <Pine.LNX.4.33.0107251827170.28361-100000@willow.nutstreet.net>
	<Pine.LNX.4.33.0107260038030.3644-100000@greebo.foobarhouse.com>
	<20010726133632.A26425@tiger.bigcats.invalid>
From: Paul Jarc <prj@po.cwru.edu>
Date: Thu, 26 Jul 2001 15:06:38 -0400
In-Reply-To: <20010726133632.A26425@tiger.bigcats.invalid> (Wolfgang
 Weisselberg's message of "Thu, 26 Jul 2001 13:36:32 +0200")
Message-ID: <m3ae1r7bmz.fsf@multivac.cwru.edu>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Wolfgang Weisselberg <weissel@netcologne.de> writes:
> Personally, I name my LVs to match their (usual) mountpoints,
> because I do not want to remember the number/mountpoint
> matching, so I have LV names like 
> 
>     /dev/main_vg/usr
>     /dev/main_vg/var
>     /dev/main_vg/var_spool_news         # mounts on /var/spool/news

See also: <URL:http://multivac.cwru.edu./fs/>.  This also makes it
easier to get by without LVM.


paul
