From: Eamonn Hamilton <eamonn.hamilton@saic.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1018291425.21592.7.camel@snifter>
MIME-Version: 1.0
Subject: [linux-lvm] vg recovery after PV failure
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
Date: Mon Apr  8 13:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Hi Folks.

I'm attempting to recover a VG on a friends system after one of the PVs
started acting a bit odd. The VG appears to say that it has no PVs
associated with it, and a vgscan only finds the second PV on the disk. A
pvdisplay, however, show both physical volumes have what appears to be
the correct information and extents.

I'm basically wondering how do I get these two physical volumes
associated again, and is there any way to determine how they were put
topgether, i.e. were they striped? Also, is there any way to get the
information off the non-dodgy disk ( it's ext3, btw ).

Cheers,

Eamonn

 
