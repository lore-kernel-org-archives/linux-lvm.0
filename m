Mime-Version: 1.0 (Apple Message framework v548)
From: Tod Detre <tod@po.cwru.edu>
Content-Transfer-Encoding: 7bit
Message-Id: <B2C5CF6E-0615-11D7-9BB3-000393B2C740@po.cwru.edu>
Subject: [linux-lvm] bad vgexport/import
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
Date: Mon Dec  2 10:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I've been having troubles with one of my systems so I did a vgexport on 
one of my volume groups in case I found part of the system to be 
unrecoverable. When I got the system back online I tried to do a 
vgimport, but it complained about the first disk not being in the same 
group as the other disks. I looked at the pvscan output found that the 
first disk did not appear to have been exported with the rest of the 
disks. This could have been from the troubles I was originally having.

Well, I did some google searches and found someone with a similar 
problem and he used lde (linux disk editor) to change the volume group 
name to match the other disks, well, I tried changing the unexported 
disk to be "exported" and it seems to have somewhat worked, but not 
completely. I now get this error:

vgimport mirror /dev/hdc1 /dev/hde1 /dev/hdg1 /dev/hdi1 /dev/hdk1
vgimport -- ERROR: only 5 physical volumes of 4 given for volume group 
"mirror"

any ideas on how to fix this?

--
Tod Detre
Unix Technical Support
Case Western Reserve University
usworkstation@po.cwru.edu
216-368-3060
