From: adimaths@softhome.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <courier.3F987755.00006508@softhome.net>
Subject: [linux-lvm] Problem of LVM on Suse
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
Date: Fri Oct 24 06:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Mauelshagen@Sistina.com, linux-lvm@sistina.com
Cc: adimaths@softhome.net

Hi, 

I am facing a problem in using LVM bundled with Suse Enterprise server 8 
,connected to storage area newtork
System configuration:
A storage area network is connected to a server with OS Suse Enterprise 
server 8.
So there are multiple scsi devices whose physical disk is identical. 

We are creating a Pseudo device file asscociated with identical scsi devices 
using a driver that we have created.
eg : /dev/pseudo-device -> /dev/sda , /dev/sdb 

Now using the bundled LVM on such pseudo device is a problem.
problem details:
pvcreate /dev/pseudo-device
[result] ok. 

pvscan
[result] it shows the scsi device associated with this pseudo device ie 
/dev/sda and not our pseudo device. 

If LVM bypasses our pseudo device then the purpose of creating this device 
and associating it with scsi is futile. 

The irony is, LVM works fine on RH 2.1 kernel = 2.4.9-e.3 and also with RH 
7.2
However the above mention problem is observed on Suse Enterprise server 8 
,RH 2.1 kernel =2.4.9-e.25, RH 7.3 and RH 8.0. 

Would request you to clarify the following :
1>Could you please tell me how this problem can be rectified ? 

2>Is it that Lvm that is bundled with the OS can't be used for
the above mentioned purpose ? 

3>If it can't be , then what design feature
of the current LVM prevents it from supporting the above task? 

4> Can any change in our product help us to solve this problem? 

5>Moreover I think LVM on RedHat is working just by chance.
I think pvscan depends on the order of the devices in the
/proc/partitions , and hence when our pseudo devices are
at the end of the /proc/paritions , pvscan shows our devices
as active else it shows scsi as active. 

Is my inference correct? 

Regards
Aditya Vasudevan 
