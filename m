Message-ID: <3EC0951E.90304@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM & LFS support
References: <B742DEF5E2578F43AB48979887E6CF060E16BD@MAIL001.AD.MLP.COM> <20030510155825.GA24798@localhost>
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
Date: Tue May 13 01:47:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jose Luis Domingo Lopez wrote:
> On Tuesday, 29 April 2003, at 14:09:44 -0400,
> Selimaj, Naxhije wrote:
> 
> 
>>Does LVM support files greater that 2GB?  
>>I'm running the default LVM (1.0.3) on RH8.  I currently have a 1.2TB
>>LVM  ext3 filesystem mounted.  If >2GB  file is supported, what changes
>>need to be made to my existing setup.
>>
> 
> I think the 2 GB limit on files is a filesystem limitation, not a block
> device limitation, and as LVM is a block device level feature, it should
> not impose any limits on file sizes.

Other than not being larger than the blockdevice, and doesnt the
blockdevice has a limit of 2T ?


> As far as I know, RH8 is recent enough to fully support large files
> (greater than 2 GB), but maybe you are using some sort of application
> not ported still to support large files, or an application on your.
> 
> I seem to remember that things like "old" cpio didn't support large
> files, check if this is the case with "strace", and look for file
> open()'s with flags O_LARGEFILE. From open(2):
> 
>        O_LARGEFILE
>               On  32-bit  systems  that  support the Large Files System, allow
>               files whose sizes cannot be represented in 31 bits to be opened.

Maybe thats why i have some trouble with pipes for files larger than 2G



JonB
