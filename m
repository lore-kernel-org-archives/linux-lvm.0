From: Spam <spam@tnonline.net>
Message-ID: <54241964828.20031107115257@tnonline.net>
Subject: Re[2]: [linux-lvm] vgreduce fails
In-Reply-To: <20031107114146.C28265@sistina.com>
References: <5211632953.20031103044044@tnonline.net>
 <20031107114146.C28265@sistina.com>
MIME-Version: 1.0
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
Date: Fri Nov  7 04:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

  Yes  I tried that way too. I had tried restarting the system with no
  luck  too.  But  when  I  changed to LVM2 it worked fine without any
  problems.  I  have  no  idea what was wrong. I tried to move several
  different disks and all gave the same error with LVM1.
  

> Have you tried removing the one free PV rather than using "-a" ?
> Have you run vgck to check volume group consistency ?
> Does the machine have an extraordinary long uptime ?

> On Mon, Nov 03, 2003 at 04:40:44AM +0100, Spam wrote:
>> 
>>   I am trying to reduce a physical volume from my VG "Server" but
>>   when I get to the step "vgreduce" it fails with this error:
>> 
>>   vgreduce -- ERROR "parameter error" reducing volume group
>> "Server" by physical volume
>> "/dev/ide/host2/bus0/target0/lun0/part1" in kernel
>>   
>>   There is a logfile and debug output on http://tnonline.net/lvm.txt
>>   (also attached as lvm.zip).
>> 
>>   I am using Gentoo Linux, but tried with vanilla kernel 2.4.22 and
>>   lvm tools 1.0.7.
