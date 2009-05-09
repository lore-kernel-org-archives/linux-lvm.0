Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n49JZBmB032619
	for <linux-lvm@redhat.com>; Sat, 9 May 2009 15:35:11 -0400
Received: from web87105.mail.ird.yahoo.com (web87105.mail.ird.yahoo.com
	[87.248.114.77])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n49JYro1006825
	for <linux-lvm@redhat.com>; Sat, 9 May 2009 15:34:54 -0400
Message-ID: <164519.90166.qm@web87105.mail.ird.yahoo.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
Date: Sat, 9 May 2009 19:34:52 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <20090508205312.GA7838@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Script to import hardware snapshoted VGs
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com


> Hi Chris,

> 
> I actually worked on such a script a little over a month ago but haven't
> had a chance to get back to it.  I've reviewed your script and have
> inlined some comments/suggestions below.

Thanks a lot :)

Most of your suggestions are pretty straightforward and I'll put them in, but the PV name problem is nasty, sorting out my script to deal with them is doable, but there is an issue with setting lvm.conf to filter devices called /dev/$*^  would really upset the regular expression parser. I'm tempted to say that people who call their devices things like that deserve everything they get, but maybe symlinking them to a sensible name (e.g $TMP_LVM_SYSTEM_DIR/dev/temp1) would be better. I'll have a think.  

Oh and it deals with exported volume groups because I hit that one during testing, maybe I have weird usage patterns!

chris


> On Thu, May 07 2009 at  6:05pm -0400,
> chris procter wrote:
> 
> > If your VG is called myvg you should now also have a new vg called
> > myvg.1 with different uuids. It will ignore incomplete volume groups,
> > or exported volume groups unless the -i flag is used. 
> 
> I applaud your support of volume groups that are either imported or
> exported.  Not strictly needed but thorough.
>
> > function appenddisk {
> > ### add a blockdevice path (/dev/sda etc) to a list if its valid
> >     LIST=$1
> >     DISK=$2
> > 
> >     if [ ! -b "${DISK}" ]
> >     then
> >         echo " ${DISK} not a valid block device - ignoring" >&2
> >         echo "${LIST}"
> >         return
> >     fi
> > 
> >     if [ -z "${LIST}" ]
> >     then
> >         LIST="${DISK}"
> >     else
> >         LIST="${LIST} ${DISK}"
> >     fi
> >     echo ${LIST} 
> > } 
>
> One use-case that was off my radar until others pointed it out is when
> obscure PV names exist in the system.  Using shell and not explicitly
> checking for such awkward PV names can cause the script to fail.  Names
> might exclude any of the following (taken from the LVM2 source's
> test/t-mdata-strings.sh): "__\"!@#\$%^&*,()|@||'\\\""
> 
> The lvm tools can handle such names as long as the user takes care to
> properly escape the special characters because once passed in as an arg
> the C-code won't interpret the characters at all; unfortunately shell
> will.
> 
> So we likely need to at least detect that the supplied PV name(s)
> contain "unsupported" (by this script) characters and error out
> accordingly.  This is the part that caused me to put my script stall.
>
> > SHOW=0
> > DISKS=""
> > LVMCONF="/etc/lvm/lvm.conf"
> > TMPDIR="/tmp/lvm"
> ...
> > 
> > #####################################################################
> > ### Prepare the temporay lvm environment
> > #####################################################################
> > if [ ! -d "${TMPDIR}" ]
> > then
> >     mkdir "${TMPDIR}"
> >     checkvalue $? "Unable to create ${TMPDIR}"
> > fi
> ...
> > awk -v var="${FILTER}" '/^[[:space:]]*filter/{print var;next};{print $0}' < 
> ${LVMCONF} > ${TMPDIR}/lvm.conf
> 
> 
> You have a security hole here because some user _could_ create /tmp/lvm
> in advance and symlink /tmp/lvm/lvm.conf to some random file they want
> overwritten by root.
> 
> Also, TMPDIR is a standard name used by other tools; likley best to
> side-step it by using something like "TMP_LVM_SYSTEM_DIR".
> 
> Using the following would be best:
> TMP_LVM_SYSTEM_DIR=$(mktemp -d --tmpdir snap.XXXXXXXX)
> 
> There really isn't any need to expose which TMPDIR to use with -t; just
> allow the user to set TMPDIR in their environment and mktemp will "just
> work" with it.
> 
> Quick side-bar: you should probably add something like the following
> early on:
> 
> if test "$UID" != "0" && test "$EUID" != "0"; then
>   echo "WARNING: Running as a non-root user. Functionality may be unavailable."
> fi
> 
> ...
> > OLDVGS=`pvs --noheadings --trustcache 2>/dev/null  | awk '(NF==6){printf("%s 
> ",$2)}'`
> 
> Existing LVM2 scripts (e.g. LVM2/script/lvm_dump.sh) allow the user to
> override which lvm binary is used for all command by doing the
> following:
> 
> # user may override lvm location by setting LVM_BINARY
> LVM=${LVM_BINARY-lvm}
> 
> die() {
>     code=$1; shift
>     echo "$@" 1>&2
>     exit $code
> }
> 
> "$LVM" version >& /dev/null || die 2 "Could not run lvm binary '$LVM'"
> 
> > #####################################################################
> > ### Change the uuids.
> > #####################################################################
> > PVSCAN=`pvscan`
> 
> The above would become:
> PVSCAN=`"$LVM" pvscan`
> 
> 
> 
> Once these things are cleaned up we should get it committed to the LVM2
> tree; in the scripts/ dir.
> 
> But these things aside, the script looks pretty good.
> 
> BTW, it should probably get renamed to have to a more standard lvm
> prefix, e.g.: vgimportclone
> 
> Regards,
> Mike



      
