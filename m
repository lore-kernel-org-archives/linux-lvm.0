Message-ID: <3BD43865.6050803@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which kernel would you recommend ??
References: <3BD40062.2D93A980@ti.com> <3BD432EE.76993E30@ti.com>
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
Date: Mon Oct 22 10:14:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I used 2.4.7 with LVM 0.9.1beta6 and 2.4.10/2.4.12 with LVM 1.01rc4 
successfully.

I am currently using 2.4.12 with LVM on a heavily used mail/IMP server 
with no problems.



christian e wrote:

>christian e wrote:
>
>>Hi,all
>>
>>I've been trying for some days now to get lvm installed on a 2.4
>>kernel..Has not been very successful to say the least.What kernel would
>>you recommend for a production file-server ?? Should I go back to 2.2.19
>>again ?? I upgraded to 2.4 due to NFS and ext3 mainly.It also has the
>>latest drivers for my megaraid controllers.But now I can't get lvm
>>compiled ..Is 2.4 even stable enough to use in production ? Can't allow
>>this server to be down as it's our primary fil-server..
>>
>
>Never mind.Down to 2.2.19 again and everything works now..Guess I'll
>keep it here for the time being..
>
>best regards
>
>Christian
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
