From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3D2235F8.8485.6AEF946@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Odd problem with Pure-ftpd on lvm volume.
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
Date: Tue Jul  2 22:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, pureftpd-users@lists.sourceforge.net

OS RedHat7.3 Linux
lvm 1.0.3
pure-ftpd 1.0.11

I initially setup a logical volume with a capacity of 300 Mb. which is 
used to receive files transmitted via pure-ftpd.  The initial space 
allocation was insufficient and I extended the lv by an additional 50 
Mb.  Now pure-ftp is reporting a "disk full error" when trying to 
upload files, however local users can add files to the lv without error.

I have absolutely no idea of where to go from here.  It seems to me 
that either both should work, or neither should work, but not that one 
should fail and the other succeed.  Any help or direction on how to 
investigate this would be appreciated.

Regards,
Jim
---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
