Return-Path: <timshel@pobox.com>
Date: Sat, 9 Jun 2001 00:40:02 +1000
From: Timshel Knoll <timshel@pobox.com>
Message-ID: <20010609004002.B3656@knoll.ln>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
Subject: [linux-lvm] pvmove failure ...
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

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am having problems trying to pvmove stuff from one physical volume to
another. I first experienced this using kernel 2.4.3 with lvm
0.9.1beta6 and the 0.9.1beta7 Debian package of the lvm tools. I then
updated to 2.4.4 with the CVS version of lvm (as of 08/06/2001 +1000),
and I am still experiencing the same problems. Basically, pvmove simply
reports:

pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe

pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents

and nothing is moved :-(

Attached is the gzipped output of an example session. Note that I get
this same problem if I attempt to move any of the other logical volumes
around as well :-( Any ideas/comments/tips?

Thanks,

Timshel

-- 
   Timshel Knoll <timshel@pobox.com>  for Debian email: <timshel@debian.org>
                Geomatics/Computer Science double degree, RMIT
      Debian GNU/Linux developer, see http://people.debian.org/~timshel/
                For GnuPG public key: finger timshel@debian.org

--fdj2RfSjLxBAspz7
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="lvm.out.gz"
Content-Transfer-Encoding: base64

H4sICEjjIDsCA3NjcmlwdC5vdXQA7d1tb9tGusbx19GnmE3fJNh1zBnq0Vjsbto63S6SNifZ
pgcoCoGWaFuILAoSpcT99GeoB1uWSJnSJffU6T9YbBpqhiKHv5EoXhLv951Rb5iacRqN0rhr
koF5NeqZ/0wGxjSNC09qzZOqNS4IbOWXUZKk/xr2hsPewAzT8XFg+tOrX78yk6tkMkjN8WQ8
ur/RZXIV399qGm1Z1fhTNEzOz81xN54eTy+C42xBfxoU95hedHvjYT+6NkdT/4+gcnR0ZD4k
/clVbC5GyWRo/ILKh+/MD5Ff8sTM/mTt/KKXnU48Hi+WjeKoe/xp1Evj7KH3aZROlg9F06jX
j8768fEoHvd+y/4ra/PVk8XjQeXNy/81rz8s/+1q9co3k9HKkmrlx2E88AvMWhfzvvdbfNOt
9qLVMt99XXkTfTZvN1Z3uySsvOykd/6dbbJf03L11eqLsJ6t6e3p3eXmzdeV/yZp1DdvTxfL
rA39E7zs95OOX2iO5x0WK7aNwC+x7kXYzFb3ahT7h9ZbNW2z7peE9kVr1spvzE8/ff/t8kkv
Pl1//Ob06O3w1ddHo28/1o/O//3Tu6Pu+0796H8+pJOj5vTTb9NaZXbkXicXvY7fuun8CGbH
zg/S6rG7tZF5y2ysHdzZ0fWdfs6O5eIYLx5ZPcjZ2K8e5NujnD10c2yNrXxlEn/wbhbMVr46
qGY20v4IjWIP/PXpTc9auBjXKJuA+Q/0ksFy8SD+nJpzP8KVd34zTXSZ/f847qTJaL4D1gWV
r32vj8YPQa+zdGP8TA52H77l1HrY4XP3D1/YchnLzQFsNXOH73bxgQbP7j54/gXx4ccuvH/s
qgX0AlfNp7fywIFGz+0+ev494OFHr3r/6Ln80atZlzt4K8sPNHZhZT54by+vxyujN54N39vF
8D376vmTlQG87EZ188w9zx7Pf5vyr8XRfDNno7J8vfeLZ6/f/r+yfQ/qTb8k+6tS/FRn5lmo
PlOj3vIL/P9veZ5OzTyz6hM1azZ7plpY9U9V2XbO0LmMBhceaTSYobtdcLT0Oz93eOoffWrG
k5nF80m/f+2PYdRJe9OMxpaneHE8nF4lU7/GwTr7lV2+OZ6VZesj4//uDS7McCnC6/I6x8Y/
QW8we+o4ZxtXVvDzy3c/fP/Ddyemd26uk4npJ+PYDJNP8ch0J6Ns3ellbGats4ev/KnTIPbO
08TPsrFXO1uenb28MVdxGnX9mHvfyZU5izofJ8O/rDxXN5mt41Pk54/v30kGaW8wif9pfrk+
Hvxqrleanr579+M783Q4bWdL2sP42fOT7LhlE+OpuV1cKd2nYKRKHZVu2QPzd/uPrHP7Ik7b
naTfHkyuzuJRNkHNNy9fvz79dluL16cvP/hDcbiV+JHoXMadj+1BNHuNXXQ3n3rppXl6s/1P
K393br7CeXPPe/Xp5u2zdZyU6rXYhHm3UZye+NfStbZ+Jau7k/vg5mps/l7lPt/KCPWSYXvq
h8e/Chc/6XgYd3qeRZkGeQdq7Ulevvrv6TvTSzppv8Qm5ezqbfvZe8GDbPdyzdsGsOsnabs3
SOPRaOI/H24a3GywRjB7M17HdKNovrXloYZhuI/Uom65e77WeM1q/qO5WHN3rXB2LIaqHfWz
v679PzaGzb/hbY5cXqdtT3Len4wvV9bsX4nni1ZWPdvJ8kel6v/sc1gK++Vu/3rrtQNT8HDu
kcnfv1KjVjRZVqRfJLP3zWR2Hrp+xA7wIrh0lQyv29lbbbvbG2+8ROQ2uJmayxZ+C9N4NgDz
hh/987bT9UPn3EntgPPipmm3N2p3It8h/zhG3W5+k1r2Z8u2FD2euzUrjW+erH3ZSwtWuNHm
HqsbO3FzDNhRdpQdZUfZUXaUHWVH/wQ7asvtaP4JYv6n5PvPZO/0y5bOP4msnZePr8dpfNXu
dRcDE38eJrModO28elu7Ep8NtjRZfAZKBuOef4pB5zrvlP5P/zF5erFlED58dzK7RLvLAMwu
iO6267nb8ZCXve4OUfypWMb8sV2VbbsClEZn7ZudjT/7XusD6R+9M5aP9zBl+3r3elX+Yzkr
MSa79H1imkH12/DrpjHj3m9+u6u3m3F+sbxivj5Pyg3WLldZ5qO12/WV/E0p0bTgJWv+7OX2
beN96f6dK+6y5Q32ALtX3OO+1/D5JpR/Fd9pUMp1zN34g540FOzkLsfkEQg54LXI9QG7++qe
/+juBn8XtVF9T7X3dEQtah9O7dmeaM8wi9ldzPZLme1vM9tffnp9uv7Fxr0Ql+2/DXM5VPXZ
n91Ubemz0wZtdfVlz56t7n5vqYvvkO4ttUx/pCJVlzr/wu7eUEt0xylOdafzryLu7bREd5z+
uZz6lY/jdDJsD5PZl/rG7fNk1B4PouH4MknHeZcu72t/N9bJu6zWzraj7U+oo0G33Z9uuYhY
MHu+BJA7XW9c+7CyOpZRv++HctvoFAzich/LjWJj/me3YdzWKXc/C7ep1KiXGclFn/uuJyw3
pPzV2x0HqGzX3J3I6bD2Obm4Re5H5cLd3e0oPRo5m/N7bfwKG5QcvrvXGooe30fo76Z6dpF2
P9X3dkU1qv9/VJ/tjfoM05iWTZc6kyvzOWa95+p5tB/bo3/4llfR55PZHQLKdZ73+iX4Nfta
Q635TS0wZuXLU6s/q7/9KFNubu5/lXufyVp+Ddsnbblp01z82W3ebO2142bdM3P+HK8U94jc
f04tpoWdT4vT09bmtFjeLuGhp8XtJfF9p0W5NTAtmBYlp4WbT4tX9Veb02JxI4yHnhU319/3
nRSlVsCcYE6UnBPhbE7Uw1a4OScWtzd56Dlxc61/3zlRagXMCeZEyTlR/XX2ren5Lj0bTPr9
57utoKauoK6uoKGuoKmuoKWuwAbyGqy8BievIZTXIHO0skcrg7SySCuTtLJJJ5t0skknm3Sy
SSebdLJJJ5t0skknm3SyyVA2GcomQ9lkKJsMZZOhbDKUTYayyVA2Gcomq7LJqmyyKpusyiar
ssmqbLIqm6zKJquyyapssiabrMkma7LJmmyypn+8kU3WZJM12WRNNlmTTdZlk3XZZF02WZdN
1mWTdf0zt2yyLpusyybrssmGbLIhm2zIJhuyyYZssiGbbOgXgmSTDdlkQzbZlE02ZZNN2WRT
NtmUTTZlk03ZZFO/OimbbMomW7LJlmyyJZtsySZbssmWbLIlm2zJJlv6JfMDXDPXL5oH+lXz
QL9sHujXzQP9wnmgXzkP9EvngX7tPNAvnge6zkNEOrrOA4Q6B0h1DhDrHCDXOUCwc4Bk5wDR
jp7tWD3cse4AiaOuU893rB7wWD3hsXrEY/WMx+ohj9VTHqvHPFbPeWx4gEBc16lHPVbPeqwe
9lg97bF63GP1vMfqgY/VEx+rRz62eoDva+g69dTH6rGP1XMfqwc/Vk9+rB79WD37sXr4Y/X0
x9YO8HUiXaceAFk9AbJ6BGT1DMjqIZDVUyCrx0BWz4GsHgTZ+gG+7abr1LMgq4dBVk+DrB4H
WT0PsnogZPVEyOqRkNUzIds4wJcxdZ16LGT1XMjqwZDVkyGrR0NWz4asHg5ZPR2yejxkmwf4
rrCuU0+IrB4RWT0jsnpIZPWUyOoxkdVzIqsHRVZPimzrAF9lP8B32fUvs+tZkdOzIqdnRU7P
ipyeFTk9K3J6VuT0rMjpWZGzB/ipha5Tz4qcnhU5PStyelbk9KzI6VmR07Mid4DfAR3gh0CH
+CWQrvMAvwU6wI+BDvBroAP8HOgAvwc6wA+C9KzI6VmR07MiFx7gh2q6Tj0rcnpW5PSsyOlZ
kdOzIqdnRU7PipyeFTk9K3LVA/yOUtepZ0VOz4qcnhU5PStyelbk9KzI6VmR07Mip2dFrnaA
n/nur3O3Amg5d2reWnrvTs273asMnsXnWd/pxYvsBnmTkZk9vqw6uFh4YsIns2r3k4FfZXjz
5OejOF4v5LeyOM5uV90bXJi3H0w/SYbFDV4XNNh9f3JvQXi3R1ZisPB+2LelFme3DXmchRap
hUgtRGohUqGLWojUQkQttRAxSy1EaiFSEYlaiNRCRCq1EHGKU2oh4pRaiNRCpBYitRCpsEWF
LWohohrV1ELENLUQqYVILUSK+VALkVqITAtqIVILkTlBLURqITInqIVILURqIVILkVqI1EKk
FiK1EKmFSC1EaiFSC5FaiNRCpBYitRCphUgtRGohUguRWojUQqQWIrUQqYVILURqIVILkVqI
1EKkFiK1EKmFSC1EaiFSC5FaiNRCpBYitRCphUgtRGohUguRWojUQqQWIrUQqYVILURqIVIL
kVqI1EKkFiK1EKmFSC1EaiFSC5FaiNRCpBYitRCphUgtxEPWQiyoBFjUc8ebSd+p2Vdwf5XH
WZBv254Vdih5+2iK/VHsjxJUlE2j2B9qKfaHWczq51aF/fa8nXOJrps3c35SdC9nqhVSs+hx
1Cwq737lbs1Pim7WTO1D3H9p7ldux/yk4G7MFFIE/ZeFfuV+y08KbrdMVUbQf1noc2OE8t1r
Wve61r2hdW9q3Vta9/xvUe3Q34r9ndg/FPuL9Kxoz4r4rKjPivys6M+J/pzoz4n+nOjPif6c
6M+J/pzoz4n+nOgvFP2For9Q9BeK/kLRXyj6C0V/oegvFP2For+q6K8q+quK/qqiv6roryr6
q4r+qqK/quivKvqrif5qor+a6K8m+qupHz1EfzXRX030VxP91UR/ddFfXfRXF/3VRX910V9d
/ewr+quL/uqiv7roryH6a4j+GqK/huivIfpriP4a6sUX0V9D9NcQ/TVFf03RX1P01xT9NUV/
TdFfU/TXVK/+if6aor+W6K8l+muJ/lqiv5boryX6a4n+WqK/lnr5Wb7+rF6ADtQr0IF6CTpQ
r0EH6kXoQL0KHaiXoQP1OnSgXogOVIl6FKJKlMMQOQ2R4xA5D5EDETkRkSMRNROxaihinZzK
qRLVXMSqwYhVkxGrRiNWzUasGo5YNR2xajxi1XzEhnJArEpUIxKrZiRWDUmsmpJYNSaxak5i
1aDEqkmJVaMSW5W/q6BKVNMSq8YlVs1LrBqYWDUxsWpkYtXMxKqhiVVTE1uTvzajSlSDE6sm
J1aNTqyanVg1PLFqemLV+MSq+YlVAxRbl7/BpUpUMxSrhihWTVGsGqNYNUexapBi1STFqlGK
VbMU25C/TKhKVOMUq+YpVg1UrJqoWDVSsWqmYtVQxaqpilVjFduUv9eqSlSTFatGK1bNVqwa
rlg1XbFqvGLVfMWqAYtVExbbkr9iLX/HWv2StZqxODVjcWrG4tSMxakZi1MzFqdmLE7NWJya
sTgrf91flahmLE7NWJyasTg1Y3FqxuLUjMWpGYuTf3ci//BE/+WJKlH+7Yn84xP51yfyz0/k
35/IP0BRMxanZixOzVhcKP8ISpWoZixOzVicmrE4NWNxasbi1IzFqRmLUzMWp2Ysrir/Hk+V
qGYsTs1YnJqxODVjcWrG4tSMxakZi1MzFqdmLK4m/zR0X4niPWuLuvtGF3Ha7g268ef22fXa
zQ/W7gS79c4Ii3sRlL8vQlGH++9Ie++9a8vfJ3WHrS7TbdtdGgruQpf/aO5N6HJ3bdcjW3zb
5D1vSzLHu989SQr6lifwh6Zoy96BZN5wMLk6i0ft81FyNWvuj117erFqJb/dxmr9lJ+3MeHd
jUgGazdjLrq34AbQ8jNql9tYl+r30Ld2zN+/HW6h/Ue/m/fBXn/WRuruPTBzH9zphpal5tEN
4dwtXNz+PXvh6yT9xUwZb0yh3BaLFS5fPEvesnjHV7/tvbbcsqfg6OU+WDQ0u7x3ZLfOX9+R
mz3Y4V12tru7v8tu7fZHeZddtJxVGYj62V/X/h8bw/b2Q87I5XXa9iTn/cn4cmXNaWLmi1ZW
Xf6Veja8e7xSb+/3B3qlXh+1EtIvkt7gIhvX2YK1I3aACbh0lQyv5+/d3d74Y96b8UaDm1em
ZQu/hWk8P0eYNfzon7edrh+68KR+6Bf/rGm3N2p3It8hd0V3Hs1ZUVBmL+70y5au3HXv9piM
r/37xlW7111sffx5mIzS1fl3f7sSLrY02XrexEtk8Fg/Px5wtuedKuU9tquye9tvfHj4gj/K
/wlOMrZepXnEn0s4XbnvIN97Nn8z04s/Et1/kW/vyz+7TrtSnb+gT9+5g/tFXeAqqTa8e706
6qS9afEuPs53K99ynEbpZLx9ax9rQbjbfdtsdVQvOr65bYfTq2T+sP87++A1vLwe9zpR38Sf
/UlOOja9gf/fYi3TpD/xm3cxSibDxc7eruDnl+9+8Os/Mb1zc51MTD8Zx2aYfIpHpjsZzT7U
+Y8js9bZw1fRtRnE/vR/9lFvXk7QLx+Z1x/emKs4jbpRGpnsE4k5izofJ8O/rDxXN5mt41M0
SLP+/qQs7Q0m8T/NL9fHg1/N9fKVOWvfHsZj6gVyUsNJTcmTmjtvlRtZBRXnqN71OKt3lQkv
AvjDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zh
D3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/8
4Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic/
/OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCH
P/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7w
hz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+
8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf
/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jD
H/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4
wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/
+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEP
f/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zh
D3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/8
4Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic/
/OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCH
P/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7w
hz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+
8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf
/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jD
H/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4
wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/
+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEP
f/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zh
D3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/8
4Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic/
/OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCH
P/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7w
hz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+
8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf
/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jD
H/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4
wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/
+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEP
f/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zh
D3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/8
4Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic/
/OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCH
P/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7w
hz/84Q9/+MMf/vCHP/zhD3/4wx/+8Ic//OEPf/jDH/7whz/84Q9/+MO/DP+rdjcZpO3eII1H
o8kwXd3S4haLFc6b+A28SqZx8TpyG+SuYhhvTMHiGbo2kAVTdEGm/Bytz/7sM0m39Mw9Apvt
19AVNshlV7Sn214hys3U3YZkPlV3HYyiDXr417eNcbs7Xwse3vIistOMLUC+S9uHmxCd2r4T
4r6eTAgmhDgh7G3bizhdO2CP+VQkb6/uNJzNMb8Zx9No1J/enCjE7X7i1z17mx1E/ZXNP09G
8x195IOSt4ubrY/qeWcVOe1ctXV7luNPTfwo3d27wjarK/N7f/tMz56fmLenJtvKp5XhNFua
tT999+7Hd0XtVja0Uvm7Xd3w8bYtt/dvuH3Q7fbLeoMLM7y8Hvc6/mjEn/3UTseVm+edDLKG
q7Ny44G8g/3LKEnSfw17w2FvYIbp+DjIOv36lXlxvNy0D5XXycXsST8k/Yl38yYaRBfxyAQv
Wi9s+5sP7yv/jnuD3/zySdwfX/rHBn8z7/2LT28QmffJefopGsXGfBulcdbamGff//jW2OB5
pfjpu76xOXpXeTXq/c2YpvnPZGBcEFhjqydBcFKtm78G/k/xCiZz4qOKe1F9UT36fD4+8g/8
tTMdZ6sJ6kHz6GO9sHvlfWfU82fP/nw8NsnAvI/SbBOetIx/8sCehMFsayr/B+siRz0bggcA

--fdj2RfSjLxBAspz7--
