From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] vgscan errors
Message-Id: <20020308235001.C12196@golem.blacknet.de>
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
    <20020305223226.A19035@sistina.com> <3C854B93.2060402@theiqgroup.com>
    <3C87A0A3.8080605@theiqgroup.com> <20020308094454.C519@sistina.com>
    <20020308021214.I1566@turbolinux.com> <20020308133510.A1267@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020308133510.A1267@sistina.com>; from
    mauelshagen@sistina.com on Fri, Mar 08, 2002 at 01:35:10PM +0100
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
Date: Fri Mar  8 16:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 08 '02 at 13:35, Heinz J . Mauelshagen wrote:
> vgscan creates cache copies of the metadata in /etc/lvmtab.d/.
> 
> So if just vgscan and "vgchange -ay" run in the initrd, there's one copy
> for every VG in /etc/lvmtab.d/ *and*
> 
> export LVM_VG_MAX_BACKUPS=no
> 
> disables automatic backup creation in /etc/lvmconf/.
> 
> vgchange needs little modification to read the data directly from the devices
> rather than from the cache files.
> 
> Should I put that into LVM 1.0.4?  ;-)
Yes, please do this.

(While I don't need this, my initrd is big enough and moves over to
tempfs very soon, but it would so much nicer to just do

vgchange -a y /dev/<root vg>/<root lv>

and save vgscan.
)

Just my 0.02 Euro,
    Goetz.
