From: Eamonn Hamilton <eamonn@snifter.freeserve.co.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <1025610944.12711.29.camel@snifter>
Mime-Version: 1.0
Subject: [linux-lvm] ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
 volume group
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
Date: Tue Jul  2 06:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Hi.

I'm getting the error as shown in the subject line from a system which
was shut down improperly ( read: turned off ! ). Is there anything I can
do to recover this, as the disks all seem fine, and pvscan finds the
physical volumes.

Any pointers gratefully received ..

Cheers,
Eamonn

P.S

pvscan -d and vgscan -d on request, as I don't want to throw 70k at the
list :-)
