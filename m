Message-ID: <400AC31B.50507@ITWM.fhg.de>
From: Martin Vogt <vogt@itwm.fhg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] bug in lvm-1.0.7-105 ?
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
Date: Mon Jan 19 12:11:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


Hello,

I think I found a bug in the

/etc/init.d/boot.lvm

script. (SuSE 9.0)

The Script mounts the root filesystem read/write to write
the information from vgscan to /etc/lvmtab.d/.

After that it tries to remount the root filesystem again with:

mount -n -o remount,ro /

This fails, which lead to a error message when

/etc/init.d/boot.localfs

is run.

This is the fix for /etc/init.d/boot.lvm:

            [...............]
               else
                echo "Remounting root file system (/) read/write for 
vgscan..."
                mount -n -o remount,rw /
                test $FSCK_RETURN -gt 0 && touch /fsck_corrected_errors
                echo "Scanning for LVM volume groups..."
                /sbin/vgscan

                # NEW [START]
                z=0
                mount -n -o remount,ro /
                while [ ! $? = 0 ] ; do
                      echo "ro mount failed: $z"
                      sleep 1
                      let "z=$z+1"
                      if [ $z -gt 10 ] ; then
                          break;
                      fi
                      mount -n -o remount,ro /                 
                done
                # NEW [END]
            [...............]


After usually 5 seconds the readonly mount succeeds.
(Is this some internal buffer flush time in the kernel ?)
The root filesystem is reiser.

regards,


Martin
