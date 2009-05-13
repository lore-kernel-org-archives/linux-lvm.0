Date: Wed, 13 May 2009 08:44:22 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090513124421.GA2267@redhat.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
	<138875.59888.qm@web87112.mail.ird.yahoo.com>
	<20090512153820.GA3012@redhat.com>
	<652717.76283.qm@web87103.mail.ird.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <652717.76283.qm@web87103.mail.ird.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: chris procter <chris-procter@talk21.com>
Cc: linux-lvm@redhat.com

On Tue, May 12 2009 at  7:15pm -0400,
chris procter <chris-procter@talk21.com> wrote:

> > @@ -76,13 +83,16 @@ fi
> > SHOW=0
> > DISKS=""
> > LVMCONF="/etc/lvm/lvm.conf"
> > -TMP_LVM_SYSTEM_DIR=`mktemp -d -t snap.XXXXXXXX`
> > +TMP_LVM_SYSTEM_DIR=`mktemp -d --tmpdir snap.XXXXXXXX`
> 
> 
> [root@boyle disktools]# mktemp -d --tmpdir snap.XXXXXXXX
> mktemp: invalid option -- -
> Usage: mktemp [-V] | [-dqtu] [-p prefix] [template]
> 
> So the long option doesn't work. The result of an old version of coreutils (coreutils-5.97-19.el5)  on CentOS5.3  not tested it on RHEL yet but if its different I'd be surprised!

OK.

> > NOVGFLAG=0
> 
> The SHOW and  NOVGFLAG variables aren't actually used any more so could be removed (my fault!)

OK.

> > @@ -135,13 +145,22 @@ LVM="${LVM_BINARY:-lvm}"
> > "${LVM}" version >&/dev/null
> > checkvalue $? "${LVM} doesn't look like an lvm binary."
> > 
> > +if [ -n "$NEWVG" ] ; then
> > +    "${LVM}" vgs $NEWVG >& /dev/null
> > +    if [ $? -eq 0 ] ; then
> > +        echo "Error: New VG ($NEWVG) already exists." >&2
> > +        exit 1
> > +    fi
> > +fi
> 
> You dont have to test if the name given with the -n option is unique
> because it gets run through the getvgname function which uses the given
> name as a starting point to build a unique name, but if you prefer to
> enforce the given name rather then just use it as a hint then thats
> fine.

I understood as much but I'm on the fence as to whether that behavior is
desirable if a specific name is explicitly provided.

> > export FILTER="filter=[ ${FILTER} \"r|.*|\" ]"
> > 
> > -awk -v DEV=${TMP_LVM_SYSTEM_DIR} '/^[[:space:]]*filter/{print 
> > ENVIRON["FILTER"];next}\
> > -                    /^[[:space:]]*scan/{print "scan = [ \"" DEV  "\" ]";next} \
> > +awk -v DEV=${TMP_LVM_SYSTEM_DIR} -v CACHE=${TMP_LVM_SYSTEM_DIR}/cache \
> > +                   '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next} \
> > +                    /^[[:space:]]*scan/{print "scan = [ \"" DEV "\" ]";next} \
> > +                    /^[[:space:]]*cache_dir/{print "cache_dir = \"" CACHE 
> > "\"";next} \
> >                      {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf
> 
> 
> This doesn't work on my setup, there is no cache_dir directive as far as I can tell, I think you're trying to change "cache =" instead so that should be:
> 
> awk -v DEV=${TMP_LVM_SYSTEM_DIR} -v CACHE=${TMP_LVM_SYSTEM_DIR}/cache \
>                    '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next} \
>                     /^[[:space:]]*scan/{print "scan = [ \"" DEV "\" ]";next} \
>                     /^[[:space:]]*cache/{print "cache = \"" CACHE "\"";next} \
>                      {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf
> 
> Otherwise it fails :(   Is this an "upgrade to the latest version" thing?

Right, the latest version uses "cache_dir".  Could change both I suppose.

> > @@ -166,18 +189,30 @@ export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}
> > #####################################################################
> > ### Change the uuids.
> > #####################################################################
> > -PVSCAN=`"${LVM}" pvscan`
> 
> I was trying to keep the number of lvm commands to the minimum because
> they can be pretty slow on some of our systems with a lot of luns
> presented, so I was trading complicated awk for speed. Wether it
> really makes a difference is debatable though.

AFAIK the latest version of lvm should not have those problems.

> > -### create a space seperated list of VGs where each VG looks like: 
> > nameexported?disk1disk2... 
> > -VGS=`echo "${PVSCAN}" |awk 
> > '$1~/PV/{for(i=1;i<=NF;i++){if($i=="VG"){vg[$(i+1)]=vg[$(i+1)]""$2} \
> > -                            if($i=="exported"){x[$(i+2)]="x"}}} \
> > -                END{for(k in vg){printf k""x[k] vg[k]" "}}'`
> 
> 
> > +PVINFO=`"${LVM}" pvs -o pv_name,vg_name,vg_attr --noheadings --separator : | 
> > sed -e "s/ //g"`
> > +
> > +# output VG info so each line looks like: name:exported?:disk1,disk2,...
> > +VGINFO=`echo "${PVINFO}" | \
> > +    awk -F : '{{vg[$2]=$1","vg[$2]} \
> > +    if($3 ~ /^..x/){x[$2]="x"}} \
> > +    END{for(k in vg){printf("%s:%s:%s\n", k, x[k], vg[k])}}'`
> 
> You could replace from PVINFO= to here with
> 
> VGINFO=`lvm pvs -o pv_name,vg_name,vg_attr --noheadings --separator : | \
>                   awk -F : '{sub(/^[[:space:]]*/,"");vg[$2]=$1","vg[$2];if($3 ~ /^..x/){x[$2]="x"}} \ 
>                                 END{for(k in vg){printf("%s:%s:%s\n", k, x[k], vg[k])}}'`
> 
> But I'm a sed-a-phobe ;)

Sure.

> > -for VG in ${VGS}
> > +for VG in ${VGINFO}
> > do
> > -    VGNAME=`echo -e "${VG}" |cut -d -f1`
> > -    EXPORTED=`echo -e "${VG}" | cut -d -f2`
> > -    PVLIST=`echo -e "${VG}" | cut -d -f3-`
> > +    VGNAME=`echo "${VG}" | cut -d: -f1`
> > +    EXPORTED=`echo "${VG}" | cut -d: -f2`
> > +    PVLIST=`echo "${VG}" | cut -d: -f3- | tr , ' '`
> 
> I was avoiding using colons as the seperator because its a valid
> character in device names, which is why I was then using control
> characters as separators, but given that we're now linking them all
> to sensible names it probably doesn't matter. 

It doesn't matter for PV names but it does for VG names.  I'll have to
think about it.

Mike
