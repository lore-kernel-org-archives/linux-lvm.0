From: Lawrence Strydom <laurie@midafrica.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1039437938.1422.27.camel@lawrence>
Mime-Version: 1.0
Subject: [linux-lvm] LV recovery
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
Date: Mon Dec  9 06:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
My company uses a SuSE email server III solution. The box has 2 IDE
drives, hda with /boot, /, and swap partintions on. The second, hdc, was
placed in a LVG with a LV for /var occupying all availlable space.
While I was away (quick absolution of self) one of the junior guys did
an online update of the software after which the system wouldn't start
again. To make a long story short, I managed to get the system going
again BUT..... /var cannot be mounted. 
/etc/fstab points to /dev/system/VAR. Upon inspection, this binary file
turns out to contain nothing but an error message about being unable to
write to /lib/modules/2.4.18-nnnnn/modules.dep. Ooops...
Now my question is this: Is it possible to recover the data from the
/var LV if the /dev/system/VAR file has gone AWOL? 
Any pointers to documentation/tools will be very much appreciated.

Thanks,
Lawrence
