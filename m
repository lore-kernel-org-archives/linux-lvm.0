Message-ID: <3FAA3C95.8010708@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can I dd one disc of a lv
References: <20031106130748.A15981@wagener.nu>
In-Reply-To: <20031106130748.A15981@wagener.nu>
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
Date: Thu Nov  6 06:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Tobias Wagener wrote:

> Now the question: Can I "dd" the faulty 200 GB drive to the new 200 GB
> drive? And if, how? Does "dd if=/dev/hde1 of=/dev/hdf1" the job, or what
> have I to do?

Heinz told me:
"You need to dd starting from the first physical extent (use pvdata -PP 
on the old one and look for pe_on_disk.base) to the same offset on the 
new disk (skip and seek dd option) and you want dd to continue after 
read errors (noerror option)."

Also, I was recently told about the dd_rescue utility, but I haven't had 
the misfortune/opportunity to try that one yet.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
