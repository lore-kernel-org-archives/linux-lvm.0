From: Daniel Heemann <daniel.heemann@gmx.de>
Subject: Re: [linux-lvm] All LV have the same content after repair attempt
References: <200303310028.27139.daniel.heemann@gmx.de>
In-Reply-To: <200303310028.27139.daniel.heemann@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200304062012.55616.daniel.heemann@gmx.de>
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
Date: Sun Apr  6 13:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I don't know what caused the problem but I could rescue the data as follows:

I performed all steps as described before but I left only one LV in the backup 
file. Editing and restoring the metadata for every LV step by step each LV 
then contained the right stuff. As it was still not possible to activate all 
LVs at the same time I removed the VG after saving all data and created a new 
VG...

Regards
Daniel
