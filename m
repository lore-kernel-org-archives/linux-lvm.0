From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] FW: Logical Volume Manager
Message-ID: <20020805182225.GA28108@localhost>
References: <FOEKLLKHFOMPIDEHNBHMMEAJCDAA.mmouw@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FOEKLLKHFOMPIDEHNBHMMEAJCDAA.mmouw@sistina.com>
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
Date: Mon Aug  5 13:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 05 August 2002, at 12:17:47 -0500,
Montgomery Mouw wrote:

> Hi There,
>           I wonder if you can help me please, I want to setup a 11TB single
> volume under Redhat Linux 7.3 but LVM appears to only support 300GB is it
> possible for it to support 11TB.
> 

With the default settings (PE size of 4 MB) there is a limit of 256 GB
per LV in current LVM versions (1.x series). For such a large LV choose
a larger PE size at vgcreate time. From its manual page:

       -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the  physical extent size on physical volumes
              of this volume group.  A size suffix (k  for  kilo
              bytes up to t for terabytes) is optional, megabytes
              is the default if no suffix is present.  Values can
              be  from  8 KB to 16 GB in powers of 2. The default
              of 4 MB causes maximum LV sizes of  ~256GB  because
              as  many  as  ~64k extents are supported per LV. In
              case larger maximum LV sizes  are  needed  (later),
              you  need  to  set the PE size to a larger value as
              well. Later changes of the PE size in  an  existing
              VG are not supported.


Regards,

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
