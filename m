Message-ID: <3B93DEF2.5040809@st-peter.stw.uni-erlangen.de>
Date: Mon, 03 Sep 2001 21:50:10 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Foreign HD with LVM-Partition, how to read Data?
References: <006b01c13448$755ea0b0$0df1d981@piefke> <3B934B19.1060308@st-peter.stw.uni-erlangen.de> <002d01c134ac$7ba0f590$0df1d981@piefke>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

no you dont
you have to run vgscan

it will tell you what have it found and it should find the VG on the 
other disk
if vgscan does not tell you that the VG is activate you should run
vgchange -ay [and the name of the VG]

and then you go to /proc/lvm/  and take a look at a file called i think 
general
you can do ls and in case it's general
cat general
will give you information of all the VG's and LV's found on your PC

and you simply mount /dev/ [the name of the VG] / [ the name of the LV] 
  / [your mount point]
 
this should be all


Alexander Bruns wrote:

>Hi,
>
>>Hi i could't completly understand you
>>
>>is that true:
>>
>>you have instaled Redhat on a working sepatarate drive
>>and you hace added a drive from a crashed system
>>if this is the case i hope you can run
>>
>
>no it is a newly installed system which never was intended to use lvm.
>i only compiled lvm etc to get hopefully read the data of the
>harddriver from the completely different system.
>
>I never activated andy volume groups or defined something with lvm.
>
>do i have to define a volumegroup with this harddrive with the same
>name from the old system?
>
>
>Greetings
>
>Alexander Bruns
>
>
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
