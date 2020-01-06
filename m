References: <20200106104857.0fa111e4@leda>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ab1f9091-3711-5e6c-e989-17f4fa144d25@redhat.com>
Date: Mon, 6 Jan 2020 12:24:56 +0100
MIME-Version: 1.0
In-Reply-To: <20200106104857.0fa111e4@leda>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] bashism in tools/Makefile.in
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Christian Hesse <list@eworm.de>

Dne 06. 01. 20 v 10:48 Christian Hesse napsal(a):
> Hello everybody,
> 
> building lvm2 with a shell other than bash fails:
> 
> % make -C tools/ command-count.h
> make: Entering directory 'lvm2/tools'
>      [GEN] cmds.h
> /bin/dash: 1: set: Illegal option -o pipefail
>      [GEN] command-lines-input.h
> /bin/dash: 1: set: Illegal option -o pipefail
>      [GEN] command-count.h
> /bin/dash: 1: set: Illegal option -o pipefail
> make: *** [Makefile:170: command-count.h] Error 2
> make: Leaving directory 'lvm2/tools'
> 
> Please fix bashism in Makefile. Thanks!
> 


Hi

Unfortunately whole lvm2 project is mostly 'bash' based and all developers 
mostly use bash - so we would welcome patches if they would provide 
equivalently working code without bashism...

Fixing couple things while the whole rest of project is still requiring bash 
doesn't make it any better - ATM  all scripts/tests/Makefiles mostly expect 
presence of bash.

Regards

Zdenek
