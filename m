MIME-Version: 1.0
Message-ID: <OF1D75A1D7.6633297C-ONCA256D64.000BB935-CA256D64.000C8213@centrelink.gov.au>
From: daniel.holt@centrelink.gov.au
Content-Type: multipart/alternative; boundary="=_alternative 000C8210CA256D64_="
Subject: [linux-lvm] rescanning a physical volume
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
Date: Tue Jul 15 08:11:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multipart message in MIME format.
--=_alternative 000C8210CA256D64_=
Content-Type: text/plain; charset="us-ascii"

Hi,

we are messing around with LVM and dynamically increasing SAN disk 
capacity.

We are trying to get to a point where we can increase capacity to the host 
dynamically on demand without interruption to the host. This is one of the 
major advantages of a storage area network, we can increase the size of a 
LUN on the fly, then we just need the host to pick it up. The reiser FS 
can successfully increase itself over the new volume, we are just trying 
to get LVM to pickup the new size of the physical volume.

Is there a command to re-scan the size of a physical device and update the 
physical volume under LVM. We can't seem to find one.

any suggestions are very appreciated.

Daniel Holt
SAN Tuning & Storage Administrator
PH: (02) 6219 8047
MOB: 0414 99 22 63

Important:  This e-mail is intended for the use of the addressee and may contain information that is confidential, commercially valuable or subject to legal or parliamentary privilege.  If you are not the intended recipient you are notified that any review, re-transmission, disclosure, use or dissemination of this communication is strictly prohibited by several Commonwealth Acts of Parliament.  If you have received this communication in error please notify the sender immediately and delete all copies of this transmission together with any attachments.


--=_alternative 000C8210CA256D64_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">we are messing around with LVM and dynamically increasing SAN disk capacity.</font>
<br>
<br><font size=2 face="sans-serif">We are trying to get to a point where we can increase capacity to the host dynamically on demand without interruption to the host. This is one of the major advantages of a storage area network, we can increase the size of a LUN on the fly, then we just need the host to pick it up. The reiser FS can successfully increase itself over the new volume, we are just trying to get LVM to pickup the new size of the physical volume.</font>
<br>
<br><font size=2 face="sans-serif">Is there a command to re-scan the size of a physical device and update the physical volume under LVM. We can't seem to find one.</font>
<br>
<br><font size=2 face="sans-serif">any suggestions are very appreciated.<br>
<br>
Daniel Holt<br>
SAN Tuning &amp; Storage Administrator<br>
PH: (02) 6219 8047<br>
MOB: 0414 99 22 63</font><CODE><FONT SIZE=3><BR>
<BR>
Important:  This e-mail is intended for the use of the addressee and may contain information that is confidential, commercially valuable or subject to legal or parliamentary privilege.  If you are not the intended recipient you are notified that any review, re-transmission, disclosure, use or dissemination of this communication is strictly prohibited by several Commonwealth Acts of Parliament.  If you have received this communication in error please notify the sender immediately and delete all copies of this transmission together with any attachments.<BR>
</FONT></CODE>

--=_alternative 000C8210CA256D64_=--
