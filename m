Return-Path: <j.e.s.de.jong@freeler.nl>
Message-ID: <3A296084.337D6ECA@freeler.nl>
Date: Sat, 02 Dec 2000 21:50:12 +0100
From: Jorg de Jong <j.e.s.de.jong@freeler.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from 
 /dev/raw/...
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

your mail trigged me to try this on my system! 

SQL> create tablespace x datafile '/dev/raw/raw1' ;
create tablespace x datafile '/dev/raw/raw1'

Tablespace created.

and I did not have any problems what so ever!
my setup is : 
- rh7.0 
- 2.4.11 stock kernel with 
- plain old LVM 8.0 (usertools patched)
- Oracle is 8.1.6 SE

regards 
-- 
Jorg de Jong
Work : mailto:jorg.de.jong@ict.nl 
Play : mailto:j.e.s.de.jong@freeler.nl
