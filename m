Message-ID: <3E5919A3.2010404@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "umount" LVM stuff
References: <3E58E03E.3020401@machturtle.com> <20030223181304.V14285@zealot.blacknet.de>
In-Reply-To: <20030223181304.V14285@zealot.blacknet.de>
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
Date: Sun Feb 23 12:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Goetz Bock wrote:

>On Sun, Feb 23 '03 at 09:52, David Corbin wrote:
>  
>
>>[ ... ]  What is the correct way to "unmount" all the LVM stuff so
>>that nothing is currently running on top of /dev/md0, without
>>permanently changing any of my LVM configuration?
>>    
>>
>What about
>
>vgchange -a n 
>
>not?
>  
>
Well, that appears to have solved the immediate probelm.  Now, help me 
get through the next one....

Attempts to access the logical volume I used to fail. 

piano:/etc# ls -ltar /dev/vg0
total 28
crw-r-----    1 root     disk     109,   0 Feb 23 13:35 group
drwxr-xr-x   10 root     root        24576 Feb 23 13:35 ..
dr-xr-xr-x    2 root     root         4096 Feb 23 13:35 .
piano:/etc# ls -ltar /dev/vg0/group
crw-r-----    1 root     disk     109,   0 Feb 23 13:35 /dev/vg0/group
piano:/etc#

I'm concerted that "group" is /dev/vg0, instead of "data".

Ideas on how I can recover this?

David.
