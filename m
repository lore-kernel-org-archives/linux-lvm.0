From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20020925114615.C29192@sistina.com>
References: <001b01c26403$5926f500$3b09580a@boscov.com>
Mime-Version: 1.0
In-Reply-To: <001b01c26403$5926f500$3b09580a@boscov.com>; from Rschwartz@boscovs.com on Tue, Sep 24, 2002 at 03:48:25PM -0400
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
Date: Fri Sep 27 07:19:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Rob.

On Tue, Sep 24, 2002 at 03:48:25PM -0400, Rob Schwartz wrote:
> Hello Heinz,
> 
> I'm having a problem with running lvm on SuSE Linux 7.2 (2.4 kernel) on a s/390 with VM platform.    I VM format my dasd devices, do linux dasdfmt's and fdasd's and everything looks fine.   The pvcreate looks great as does the vgcreate.   I then try to lvcreate through yast and get the following error.   Return code of the output was 98, lvcreate -- error: VGDA in kernel and lvmtab are not consistent: please run vgscan.   I run vgscan and get the same thing.    I think I did everything correctly.   Can I view the VGDA in the kernel?

cat /proc/lvm/global

> Can I change it?

Just by running the LVM tools.

> Any ideas about what is going on???

LVM1 stores work copies of the VGDA (i.e. the metadata) in /etc/lvmtab and
/etc/lvmtab.d/. Is that file and the directory write accessable and is
there enough space (couple of MB is sufficient)?

> 
> Than you very much!!!
> 
> Confused in Eastern USA,

Hopefully no longer ;)

> 
> Rob
> 
> Robert C Schwartz
> Technical Services
> Boscovs Department Stores LLC
> 610-929-7387
> rschwartz@boscovs.com
> 
> 
> 
> 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
