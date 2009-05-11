Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BIeAX4018568
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 14:40:10 -0400
Received: from web87112.mail.ird.yahoo.com (web87112.mail.ird.yahoo.com
	[87.248.114.80])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n4BIdpp2002109
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 14:39:52 -0400
Message-ID: <138875.59888.qm@web87112.mail.ird.yahoo.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
Date: Mon, 11 May 2009 18:39:50 +0000 (GMT)
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


Hi,

Here's version 2. I've got it to play nicely with device names like:-
/dev/"__\"!@#\$%^&*,()|@||\\\""
/dev/\*

/dev/''*   (with trailing space and single quotes)
/dev/$* ^"
which should cover pretty much all possibilities by symlinking them from the temp directory and using the links which all seems to work and gets round issues with the filter regular expressions in lvm.conf  Hopefully that covers all the weirdness anyone is likely to use. 

One day I will work out how to use CVS and do proper diffs :)

################# vgimportclone #############################
#!/bin/sh

# Copyright (C) 2009 Chris Procter All rights reserved.
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions
# of the GNU General Public License v.2.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


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
    echo -e "Usage: ${SCRIPT} [options] [disk1...]"
    echo -e "\t\t-h\t\t- Display this usage message"
    echo -e "\t\t-i\t\t- Import any exported volume groups found"
    echo -e "\t\t-n\t\t- Name for the new volume group(s)"
    echo -e "\t\t-l [path]\t - location of lvm.conf (default ${LVMCONF})"
    exit 0
}

function cleanup {
    #set to use old lvm.conf
    LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}

    if [ ${DEBUG} -eq 0 ]
    then 
         rm -r ${TMP_LVM_SYSTEM_DIR}
    fi
}

SCRIPTNAME=`basename $0`


if [ "$UID" != "0" -a "$EUID" != "0" ]
then
    echo "${SCRIPTNAME} must be run as root, and you aren't."
    exit 0;
fi

SHOW=0
DISKS=""
LVMCONF="/etc/lvm/lvm.conf"
TMP_LVM_SYSTEM_DIR=`mktemp -d -t snap.XXXXXXXX`
NOVGFLAG=0
IMPORT=0
DEBUG=0
DEVNO=0

export ORIG_LVM_SYS_DIR="${LVM_SYSTEM_DIR}"

trap  cleanup 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18

#####################################################################
### Get and check arguments
#####################################################################
while [ $# -ne 0 ]
do
    case $1 in
        -d)    DEBUG=1
            exec 2> ./${SCRIPTNAME}.log
               set -x
            echo "Using $TMP_LVM_SYSTEM_DIR/lvm.conf"
            shift
            ;;
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
        -n)    NEWVG="$2"
            shift
            shift
            ;;
        *)    if [ -b "$1" ]
            then
                ln -s "$1" ${TMP_LVM_SYSTEM_DIR}/vgimport${DEVNO}
                DISKS="${DISKS} ${TMP_LVM_SYSTEM_DIR}/vgimport${DEVNO}"
                DEVNO=$((${DEVNO}+1))
            fi
            shift
            ;;
    esac

done


### check we have suitable values for important variables
if [ -z "${DISKS}" ]
then
    usage
fi

LVM="${LVM_BINARY:-lvm}"
"${LVM}" version >&/dev/null
checkvalue $? "${LVM} doesn't look like an lvm binary."


#####################################################################
### Get the existing state so we can use it later
#####################################################################

OLDVGS=`"${LVM}" pvs --noheadings --trustcache --separator  2>/dev/null  | awk -F  '/lvm2/{printf("%s ",$2)}'`


#####################################################################
### Prepare the temporay lvm environment
#####################################################################

###create filter
for BLOCK in ${DISKS}
do
    FILTER="\"a|^${BLOCK}$|\",${FILTER}"
done

export FILTER="filter=[ ${FILTER} \"r|.*|\" ]"

awk -v DEV=${TMP_LVM_SYSTEM_DIR} '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next}\
                    /^[[:space:]]*scan/{print "scan = [ \"" DEV  "\" ]";next} \
                    {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf

### set to use new lvm.conf
export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}


#####################################################################
### Change the uuids.
#####################################################################
PVSCAN=`"${LVM}" pvscan`

### create a space seperated list of VGs where each VG looks like: nameexported?disk1disk2... 
VGS=`echo "${PVSCAN}" |awk '$1~/PV/{for(i=1;i<=NF;i++){if($i=="VG"){vg[$(i+1)]=vg[$(i+1)]""$2} \
                            if($i=="exported"){x[$(i+2)]="x"}}} \
                END{for(k in vg){printf k""x[k] vg[k]" "}}'`

for VG in ${VGS}
do
    VGNAME=`echo -e "${VG}" |cut -d -f1`
    EXPORTED=`echo -e "${VG}" | cut -d -f2`
    PVLIST=`echo -e "${VG}" | cut -d -f3-`

    if [ -n "${EXPORTED}" ]
    then
        if [ ${IMPORT} -eq 1 ]
        then
            "${LVM}" vgimport ${VGNAME}
        else
            echo "Volume Group ${VGNAME} exported, skipping."
            continue
        fi

    fi

    ### change the pv uuids
    BLOCKDEVS=`echo ${PVLIST} | tr '' ' '`
    if [[ "${BLOCKDEVS}" =~ "unknown" ]]
    then
        echo "Volume Group ${VGNAME} incomplete, skipping."
        continue
    fi

    for BLOCKDEV in ${BLOCKDEVS}
    do
        "${LVM}" pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}' 
        checkvalue $? "Unable to change pvuuid for ${BLOCKDEV}"
    done

    NEWVGNAME=`getvgname "${OLDVGS}" "${VGNAME}" "${NEWVG}"`

    "${LVM}" vgchange --uuid ${VGNAME} --config 'global{activation=0}'
    checkvalue $? "Unable to change vguuid for ${VGNAME}"

    ## if the name isn't going to get changed dont even try.
    if [ "${VGNAME}" != "${NEWVGNAME}" ]
    then
        "${LVM}" vgrename "${VGNAME}" "${NEWVGNAME}"
        checkvalue $? "Unable to rename ${VGNAME} to ${NEWVGNAME}"
    fi

done

#####################################################################
### Restore the old environment
#####################################################################
### set to use old lvm.conf
LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}

### make sure all the device nodes we need are straight
"${LVM}" vgmknodes >/dev/null

### sort out caches.

"${LVM}" pvscan
"${LVM}" vgscan >/dev/null

exit 0



      
