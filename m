Return-Path: <diedvdyk@jedi.van-dijk.net>
Content-Type: Multipart/Mixed;
  charset="iso-8859-1";
  boundary="------------Boundary-00=_V8H5AB25YE0CK55VG3KR"
From: Diederick van Dijk <diedvdyk@jedi.van-dijk.net>
Date: Mon, 2 Apr 2001 07:43:43 +0200
MIME-Version: 1.0
Message-Id: <01040207434300.00937@darkvader>
Subject: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
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
To: linux-lvm@sistina.com

--------------Boundary-00=_V8H5AB25YE0CK55VG3KR
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi,

I've a LVM of 8 physical volumes that I've created with LVM 0.9.1 beta 2.
I've the know problem that vgscan reports that it can't find my VG.
So I upgraded to LVM 0.9.1 beta 6 (tools and kernel) and runned on each
physical disk a vgcfgrestore. Unfortunately I didn't solve the problem.
Attached is the output of the commands vgdisplay -v and a pvdata -U for each 
physical disk. Debug logs a very huge so I won't attach them.

Thanks



--------------Boundary-00=_V8H5AB25YE0CK55VG3KR
Content-Type: application/x-gzip;
  charset="iso-8859-1";
  name="log-lvm.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="log-lvm.gz"

H4sICIcQyDoAA2xvZy1sdm0A7ZnLcuI6EIb3fgpVZcMsGmz5zmog3BJCwp2EqbMQWIATwGAbG3j6
I0FOBkJgwuAcskALinK39Uv9dUt08ct1HP/nM7VsxL/9c4UmgUV8gqCBEhYNEgOLYAEA0J3t+cjp
oclg4dldMkSBM5yNKGo0bjIeYh4CEkRRTKLQDFPUAKrXDKhYvQbUM9oCwnz2Gpb5QQ5qotJKB8xX
SiL1sUPSCnQLHQr27TwLWap3YD7NTcFKiT7ctmm1U2e+OInuK4NS9gVmLSsP97W2CYV8fwwlo1cH
4ngBPMsvhfsX5isn0W278OSE8FwoYmjVlgVo68sbkDPGNeCcloNeuZ6aN5ivkkS2/YynLSheZwZA
cLMD08d2F9QFNkHr3vXZGuxMWWG+ahJNTNoajUAeFGyw+ikb8krbhv6ylwHjkepgzdyqZjFfLYkM
QsxUCcxxaQ4lLOVBHVXzMB0tClCrq2UohkWzYjJfPcnDh7Klcv1pFUjh1yeoyMdR8Ws6fcxAkYyr
8KQvipC+FUPoTUMbcpkqBatGiFy5UDmNSke61Mo3pHI5wb4jFeVC5RtSUS9UviEV7ULlG1LRL1T+
Zyp87JIJ+pbtTYZkgSBYIWmuCfRdZzZZvdjMo3vCnmyPoA98Gm5NdbvU87asLiVWInRtn3KHmk/8
2bYDCYg9JJ0hTbjUs5f8G/e8QjtDFEqpR3TXfP8cq5pwPXM/sBjCw4SOdw3GfzPV7OXmdrCqxk0T
5dNCicxRea/SrsUQUl3/w+d819sqfEhmHCtcqJz9yKygUlqoOz6rA+awbTKxJqSGQ6fLTYnNt5lJ
Zk/43DKfO+dSZnrvtXLBXIAtjZfXO+2nZqocNiG7SEvwMBvcglk0+nDzMJqCXJnLMMiaE3UsrKvW
6W8WK08SFtUPkmRd7a+pkgjDcE8yvWUTm6bFs+ZdTm2kE8e3m06/84k7fJBFSBKukMPTYtewmxGr
gePmKp4MvUvHPrrbRqKr4hoI8am1bdww2c624pjOfdRjhIQq2xMiA/7p0a7vuOsdSVgU0uzVF8RC
Z3c3V6UaSfEkAJ4zc1lYzwcBHw1BjpvSAQgSuxz2Udi0RYxBOglDMAqJS89HQf4LCopxgIJh7oWw
YYqYAT6JwcxzzwdAORqAGje0Q2WgHigD9cvKQD4JwcAZnbEI1KMZSHFFP8BA1rV9CDZMERNQTjuI
yBmLQDseADvQ+Q+YPQDw/gsZf9mFrJ4EwB9NzgdAP/4UOhh/Cat7z6Dfpojjr532gygkZwRgHF8B
2DgAQMZ7DyD8ReHXWX+OVgTK2x38unkvvzKIXf3YeO/tzzEUM35wn0P9IWtbyHrpq1C+dUcJtOpz
1n2SzLsbma3ksKCMYlI0gjq7ChKsNf2DYkdCMSUaRX6Nf0qSRVWORtLQtU8pKiiGI9qkiKVPSaoo
pkUjya6GTylqKKZHtMlVu/5nRR3F1IjK4xXkv8m/sk+yHgAA

--------------Boundary-00=_V8H5AB25YE0CK55VG3KR--
