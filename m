Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n47M5cLC025986
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 18:05:38 -0400
Received: from web87108.mail.ird.yahoo.com (web87108.mail.ird.yahoo.com
	[87.248.115.224])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n47M5JiI012517
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 18:05:20 -0400
Message-ID: <461677.62017.qm@web87108.mail.ird.yahoo.com>
Date: Thu, 7 May 2009 22:05:17 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Script to import hardware snapshoted VGs
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
To: linux-lvm@redhat.com


Hi,

After getting kicking from Alasdair at a conference a few weeks ago for asking him about Netapp snapshots I decided it would by useful to implement http://sources.redhat.com/lvm2/wiki/HardwareSnapshotRestore (step 5 onwards) as a script. I've tested it on RHEL 5  and it seems pretty solid but I don't quite know the best way to release it to the world so here it is, all comments and advice gratefully received :)

I will get around to writing a man page, but in the meantime
1) present in your clone luns
2) figure out what devices they appear as
3) run importclone /dev/sda /dev/sdb /dev/sdc  (replacing /dev/sda etc by your clone luns obviously)

If your VG is called myvg you should now also have a new vg called myvg.1 with different uuids. It will ignore incomplete volume groups, or exported volume groups unless the -i flag is used.

chris

P.S. I'm using ascii 001 and 002 characters as seperators which might get mangled by email sorry :(

################# importclone #############################

!/bin/sh

# Copyright (C) 2009 Chris Procter All rights reserved.
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions
# of the GNU General Public License v.2.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

exec 2> ./$0.log
set -x

function appenddisk {
### add a blockdevice path (/dev/sda etc) to a list if its valid
    LIST=$1
    DISK=$2

    if [ ! -b "${DISK}" ]
    then
        echo " ${DISK} not a valid block device - ignoring" >&2
        echo "${LIST}"
        return
    fi

    if [ -z "${LIST}" ]
    then
        LIST="${DISK}"
    else
        LIST="${LIST} ${DISK}"
    fi
    echo ${LIST} 
} 

function getvgname {
### get a unique vg name  
###        $1 = list of exists VGs
###        $2 = the name we want
    VGLIST=$1
    VG=$2
    NEWVG=$3

    BASENAME="${NEWVG:-${VG}}"
    NAME="${BASENAME}"
    I=0

    while [[ "${VGLIST}" =~ "${NAME}" ]]
    do
        I=$(($I+1))
        NAME="${BASENAME}.$I"    
    done
    echo "${NAME}"
} 


function checkvalue {
### check return value and error if non zero
        if [ $1 -ne 0 ]
        then
                echo "FAIL!: $2 value: $1"
                exit $1
        fi
}


function usage {
### display usage message

    SCRIPT=`basename $0`
    echo "${SCRIPT} - Restore LVM data from a hardware snapshot"
    echo -e "Usage: ${SCRIPT} [disk1...]"
    echo -e "\t\t-h\t\t- Display this usage message"
    echo -e "\t\t-i\t\t- Import any exported volume groups found"
    echo -e "\t\t-n\t\t- Name for the new volume group(s)"
    echo -e "\t\t-l [path]\t - location of lvm.conf (default ${LVMCONF})"
    echo -e "\t\t-t [path]\t - directory for temporary lvm directory (default ${TMPDIR})"
    exit 0
}

function cleanup {
    #set to use old lvm.conf
    LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}

}


SHOW=0
DISKS=""
LVMCONF="/etc/lvm/lvm.conf"
TMPDIR="/tmp/lvm"
NOVGFLAG=0
IMPORT=0

export ORIG_LVM_SYS_DIR=${LVM_SYSTEM_DIR}

trap  cleanup 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18

#####################################################################
### Get and check arguments
#####################################################################
while [ $# -ne 0 ]
do
    case $1 in
        -h)    usage
            shift
            ;;
        -i)    IMPORT=1
            shift
            ;;
        -l)    LVMCONF="$2"
            shift
            shift
            ;;
        -t)    TMPDIR="$2"
            shift
            shift
            ;;
        -n)    NEWVG="$2"
            shift
            shift
            ;;
        *)
            DISKS=`appenddisk "${DISKS}" "$1"`;
            shift
            ;;
    esac

done

### check we have suitable values for important variables
if [ -z "${DISKS}" ]
then
    usage
fi

#####################################################################
### Get the existing state so we can use it later
#####################################################################
#pvs --noheadings --trustcache 2>/dev/null
OLDVGS=`pvs --noheadings --trustcache 2>/dev/null  | awk '(NF==6){printf("%s ",$2)}'`


#####################################################################
### Prepare the temporay lvm environment
#####################################################################
if [ ! -d "${TMPDIR}" ]
then
    mkdir "${TMPDIR}"
    checkvalue $? "Unable to create ${TMPDIR}"
fi


###create filter
for BLOCK in ${DISKS}
do
    FILTER="\"a|^${BLOCK}$|\",${FILTER}"
done

FILTER="filter=[ ${FILTER} \"r|.*|\" ]"

awk -v var="${FILTER}" '/^[[:space:]]*filter/{print var;next};{print $0}' < ${LVMCONF} > ${TMPDIR}/lvm.conf


### set to use new lvm.conf
export LVM_SYSTEM_DIR=${TMPDIR}


#####################################################################
### Change the uuids.
#####################################################################
PVSCAN=`pvscan`

VGS=`echo "${PVSCAN}" |awk '$1~/PV/{for(i=1;i<=NF;i++){if($i=="VG"){vg[$(i+1)]=vg[$(i+1)]""$2}if($i=="exported"){x[$(i+2)]="x"}}}END{for(k in vg){printf k""x[k]""vg[k]" "}}'`

echo "$VGS"

for VG in ${VGS}
do
    VGNAME=`echo -e "${VG}" |cut -d -f1`
    EXPORTED=`echo -e "${VG}" | cut -d -f2`
    PVLIST=`echo -e "${VG}" | cut -d -f3`

    if [ -n "${EXPORTED}" ]
    then
        if [ ${IMPORT} -eq 1 ]
        then
            vgimport ${VGNAME}
        else
            echo "Volume Group ${VGNAME} exported, skipping."
            continue
        fi

    fi

    ### change the pv uuids
    BLOCKDEVS=`echo ${PVLIST} | tr '' ' '`
    if [ "${PVLIST}" =~ "unknown" ]
    then
        echo "Volume Group ${VGNAME} incomplete, skipping."
        continue
    fi

    for BLOCKDEV in ${BLOCKDEVS}
    do
        pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}' 
        checkvalue $? "Unable to change pvuuid for ${BLOCKDEV}"
    done

    NEWVGNAME=`getvgname "${OLDVGS}" "${VGNAME}" "${NEWVG}"`

    vgchange --uuid ${VGNAME} --config 'global{activation=0}' 
    checkvalue $? "Unable to change vguuid for ${VGNAME}"

    ## if the name isn't going to get changed dont even try.
    if [ "${VGNAME}" != "${NEWVGNAME}" ]
    then
        vgrename "${VGNAME}" "${NEWVGNAME}"
        checkvalue $? "Unable to rename ${VGNAME} to ${NEWVGNAME}"
    fi

done

#####################################################################
### Restore the old environment
#####################################################################
### set to use old lvm.conf
LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}

### make sure all the device nodes we need are straight
vgmknodes >/dev/null

### sort out caches.

pvscan

exit 0



      
