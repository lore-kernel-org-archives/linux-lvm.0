From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20011105124433.A25542@sistina.com>
Mime-Version: 1.0
Subject: [linux-lvm] FW: ataraid problem
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
Date: Mon Nov  5 05:48:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Email: k.hall@servicepower.com

 Trying to get the /dev/ataraid devices to work (HPT370 - 4x60GB RAID0+1 to give 1x120GB mirrored stripe array) but not having much luck. Have tried adding LVM_DIR_PREFIX "ataraid" to lvm_dir_cache but no luck - pvcreate /dev/ataraid/d0p7 just returns with invalid physical volume name. fdisk shows it up as type 0x8e, and is listed in /dev/ataraid/d0p7...

any help please... ;-)

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
